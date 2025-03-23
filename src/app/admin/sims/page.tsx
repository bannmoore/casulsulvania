import database from "@/clients/database";
import Link from "next/link";

export default async function Page() {
  const sims = await database.getAllSims();

  return (
    <div>
      <h1>Manage Sims</h1>
      <Link href="/admin/sims/new" className="block mb-4">
        Add Sim
      </Link>
      {!sims.length && <div>None found.</div>}
      {!!sims.length && (
        <ul className="grid grid-cols-4 gap-4">
          {sims.map((sim) => (
            <li key={sim.id}>
              <Link
                href={`/admin/sims/${sim.id}/edit`}
                className="block bg-blue-800 hover:bg-blue-700 cursor-pointer p-4 h-20 hover:no-underline rounded-md"
              >
                {sim.firstName} {sim.lastName}{" "}
              </Link>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
