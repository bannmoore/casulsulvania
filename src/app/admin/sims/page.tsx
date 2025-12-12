import database from "@/clients/database";
import Link from "next/link";

export default async function Page({
  searchParams,
}: {
  searchParams: Promise<{ [key: string]: string | string[] | undefined }>;
}) {
  const sims = await database.getAllSims();
  const successMessage = (await searchParams).success;

  return (
    <div>
      <h1>Manage Sims</h1>
      <Link href="/admin/sims/new" className="block mb-4">
        Add Sim
      </Link>

      {successMessage && (
        <div className="alert alert-success mb-4">{successMessage}</div>
      )}

      {!sims.length && <div>None found.</div>}
      {!!sims.length && (
        <ul className="grid grid-cols-4 gap-4">
          {sims.map((sim) => (
            <li key={sim.id}>
              <Link
                href={`/admin/sims/${sim.id}/edit`}
                className="flex flex-col bg-blue-800 hover:bg-blue-700 cursor-pointer h-30 hover:no-underline rounded-md"
              >
                <div
                  className="flex-1"
                  style={{
                    backgroundImage: sim.imageUri
                      ? `url(${sim.imageUri})`
                      : undefined,
                    backgroundPosition: "center",
                    backgroundSize: "cover",
                  }}
                ></div>
                <div className="text-center p-1">
                  {sim.firstName} {sim.lastName}
                </div>
              </Link>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
