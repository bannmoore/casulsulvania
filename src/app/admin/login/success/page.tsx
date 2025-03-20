import Link from "next/link";

export default async function Page() {
  return (
    <div>
      <h1 className="mb-4">Admin Login Successful</h1>
      <Link role="button" href="/admin">
        Continue
      </Link>
    </div>
  );
}
