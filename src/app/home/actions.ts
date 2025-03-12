"use server";

import database from "@/database";
import { generateOtp } from "@/otp";
import { sendEmail } from "@/postmark";
import { addHoursToDate } from "@/util";
import { revalidatePath } from "next/cache";

export async function addSim({
  firstName,
  lastName,
}: {
  firstName: string;
  lastName: string;
}) {
  await database.insertSim({ firstName, lastName });

  revalidatePath("/");
}

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
      Welcome! Click this link to log in: <a href="https://localhost:3000/api/verify?otp=${otp}" target="_blank">GO</a>
    `,
  });
}
