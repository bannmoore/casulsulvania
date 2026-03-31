import database from "@/clients/database";
import GenerateSimForm from "./GenerateSimForm";

export default async function Page() {
  const ages = await database.getAges();
  const lifeStates = await database.getLifeStates();
  const careerBranches = await database.getCareerBranches();
  const infantTraits = await database.getTraits("infant");
  const toddlerTraits = await database.getTraits("toddler");
  const childTraits = await database.getTraits("child");
  const teenTraits = await database.getTraits("teen");
  const adultTraits = await database.getTraits("young_adult");
  const childAspirations = await database.getAspirations("child");
  const teenAspirations = await database.getAspirationsByCategory("teen");
  const adultAspirations = await database.getAspirations("young_adult");
  const sims = await database.getAllSims();
  const traitConflicts = await database.getTraitConflicts();

  return (
    <>
      <h1 className="mb-4">Generate Random Sim</h1>
      <GenerateSimForm
        sims={sims}
        ages={ages}
        lifeStates={lifeStates}
        careerBranches={careerBranches}
        childAspirations={childAspirations}
        teenAspirations={teenAspirations}
        adultAspirations={adultAspirations}
        infantTraits={infantTraits}
        toddlerTraits={toddlerTraits}
        childTraits={childTraits}
        teenTraits={teenTraits}
        adultTraits={adultTraits}
        traitConflicts={traitConflicts}
      />
    </>
  );
}
