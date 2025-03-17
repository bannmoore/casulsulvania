import database from "@/database";
import AddSimForm from "./AddSimForm";

export default async function Page() {
  const ages = await database.getAges();
  const sims = await database.getAllSims();

  return (
    <>
      <h1 className="mb-4">New Sim</h1>
      <AddSimForm ages={ages} sims={sims} />
    </>
  );
}
