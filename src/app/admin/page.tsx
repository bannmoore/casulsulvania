import database from "@/clients/database";
import { cookies } from "next/headers";
import Link from "next/link";

export default async function Page() {
  let user = null;
  const token = (await cookies()).get("token")?.value;

  if (token) {
    user = await database.getCurrentUser(token);
  }

  return (
    <>
      <h1 className="mb-4">Admin</h1>
      {!user && (
        <Link role="button" href="/admin/login">
          Login
        </Link>
      )}
      {user && (
        <Link role="button" href="/admin/sims">
          Manage Sims
        </Link>
      )}
    </>
  );
}
