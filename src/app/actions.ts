"use server";

import database from "@/database";
import { redirect } from "@/util";
import { cookies } from "next/headers";

export async function logout() {
  const token = (await cookies()).get("token")?.value;

  if (token) {
    await database.deleteSession(token);
    (await cookies()).delete("token");
  }

  redirect("/admin");

  return;
}
