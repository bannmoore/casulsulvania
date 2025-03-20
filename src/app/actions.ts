"use server";

import database from "@/database";
import { redirectWithBaseUrl } from "@/util/next";
import { cookies } from "next/headers";

export async function logout() {
  const token = (await cookies()).get("token")?.value;

  if (token) {
    await database.deleteSession(token);
    (await cookies()).delete("token");
  }

  redirectWithBaseUrl("/admin");

  return;
}
