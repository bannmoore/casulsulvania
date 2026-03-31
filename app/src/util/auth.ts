import database from "@/clients/database";
import { cookies } from "next/headers";

/** Returns the database user if currently logged in, otherwise undefined */
export async function getSessionUser() {
  let user = null;
  const token = (await cookies()).get("token")?.value;

  if (token) {
    user = await database.getCurrentUser(token);
  }

  return user;
}
