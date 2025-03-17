import database from "@/database";

export default async function Page() {
  const sims = await database.getAllSims();

  return (
    <div>
      <div className="mb-4">
        <h1>My Sims</h1>
        {!sims.length && <div>None found.</div>}
        {!!sims.length && (
          <ul>
            {sims.map((sim) => (
              <li key={sim.id}>
                {sim.firstName} {sim.lastName}{" "}
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );
}
