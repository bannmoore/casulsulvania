import database from "@/clients/database";
import Link from "next/link";

export default async function Page() {
  const sims = await database.getAllSims();

  return (
    <div>
      <div className="flex justify-between items-center mb-4">
        <h1>My Sims</h1>
        <Link
          href="/sims/generate"
          className="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded"
        >
          Generate Random Sim
        </Link>
      </div>
      {!sims.length && <div>None found.</div>}
      {!!sims.length && (
        <ul className="grid grid-cols-4 gap-4">
          {sims.map((sim) => (
            <li key={sim.id}>
              <Link
                href={`/sims/${sim.id}`}
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
