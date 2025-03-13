import Link from "next/link";

export default async function Page() {
  return (
    <>
      <h1>Admin</h1>
      <Link role="button" href="/admin/login">
        Login
      </Link>{" "}
      <Link role="button" href="/admin/sims">
        View Sims
      </Link>
    </>
  );
}
