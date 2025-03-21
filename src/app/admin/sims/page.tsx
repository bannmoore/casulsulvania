import database from "@/clients/database";
import Link from "next/link";

export default async function Page() {
  const sims = await database.getAllSims();

  return (
    <div>
      <div className="mb-4">
        <h1>Manage Sims</h1>
        {!sims.length && <div>None found.</div>}
        {!!sims.length && (
          <ul>
            {sims.map((sim) => (
              <li key={sim.id}>
                {sim.firstName} {sim.lastName}{" "}
                <Link href={`/admin/sims/${sim.id}/edit`}>Edit</Link>
              </li>
            ))}
          </ul>
        )}
      </div>

      <Link role="button" href="/admin/sims/new">
        Add Sim
      </Link>
    </div>
  );
}
