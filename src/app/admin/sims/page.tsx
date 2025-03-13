import database from "@/database";
// import LoginForm from "./home/LoginForm";
import AddSimForm from "./AddSimForm";
import Link from "next/link";

export default async function Page() {
  const sims = await database.getSims();

  return (
    <div>
      <div className="mb-4">
        <h1>My Sims</h1>
        {!sims.length && <div>None found.</div>}
        {!!sims.length && (
          <ul>
            {sims.map((sim) => (
              <li key={sim.id}>
                {sim.first_name} {sim.last_name}{" "}
                <Link href={`/sims/${sim.id}`}>Edit</Link>
              </li>
            ))}
          </ul>
        )}
      </div>

      <AddSimForm />
    </div>
  );
}
