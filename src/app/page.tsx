import database from "@/clients/database";
import Link from "next/link";

export default async function Page() {
  const sims = await database.getAllSims();

  return (
    <div>
      <h1 className="mb-4">My Sims</h1>
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
