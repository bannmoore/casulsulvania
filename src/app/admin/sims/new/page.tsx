import database from "@/database";
import { addSim } from "./actions";
import AddSimForm from "./AddSimForm";

export default async function Page() {
  const ages = await database.getAges();

  return (
    <>
      <h1 className="mb-4">New Sim</h1>
      <AddSimForm submitFormAction={addSim} ages={ages} />
    </>
  );
}
