"use server";

import { addHoursToDate } from "@/util/date";
import { config } from "@/config";
import database from "@/clients/database";
import { generateOtp } from "@/util/crypto";
import { sendEmail } from "@/clients/postmark";

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

  if (!user.isTestUser) {
    await sendEmail({
      to: email,
      subject: "Login to Casulsulvania",
      body: `
      Welcome! Click this link to log in: <a href="${config.baseUrl}/admin/login/verify?otp=${otp}" target="_blank">GO</a>
    `,
    });
  } else {
    console.debug(`Skipping email for test user: ${email}`);
  }
}
