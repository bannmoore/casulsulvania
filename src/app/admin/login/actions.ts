"use server";

import { config } from "@/config";
import database from "@/database";
import { generateOtp } from "@/otp";
import { sendEmail } from "@/postmark";
import { addHoursToDate } from "@/util";

export async function sendLoginEmail(email: string) {
  const user = await database.getUserByEmail(email);

  if (!user) {
    throw new Error("Unauthorized");
  }

  const activeOtp = await database.getOtp(email);

  if (activeOtp) {
    return;
  }

  const otp = generateOtp();

  await database.insertOtp({
    otp,
    email,
    expiresAt: addHoursToDate(new Date(), 1),
  });

  await sendEmail({
    to: email,
    subject: "Login to Casulsulvania",
    body: `
      Welcome! Click this link to log in: <a href="${config.baseUrl}/admin/login/verify?otp=${otp}" target="_blank">GO</a>
    `,
  });
}
