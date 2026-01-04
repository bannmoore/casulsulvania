import database from "@/clients/database";
import { notFound } from "next/navigation";
import EditSimForm from "./EditSimForm";
import Link from "next/link";

export default async function Page({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const id = (await params).id;
  const ages = await database.getAges();
  const lifeStates = await database.getLifeStates();
  const careerBranches = await database.getCareerBranches();
  const relationshipTypes = await database.getRelationshipTypes();
  const infantTraits = await database.getTraits("infant");
  const toddlerTraits = await database.getTraits("toddler");
  const childTraits = await database.getTraits("child");
  const teenTraits = await database.getTraits("teen");
  const adultTraits = await database.getTraits("young_adult");
  const childAspirations = await database.getAspirations("child");
  const teenAspirations = await database.getAspirationsByCategory("teen");
  const adultAspirations = await database.getAspirations("young_adult");
  const sim = await database.getSimById(id);
  const simAspirations = await database.getSimAspirations(id);
  const simTraits = await database.getSimTraits(id);
  const simCareerBranches = await database.getSimCareerBranches(id);
  const simImages = await database.getSimImages(id);
  const simRelationships = await database.getSimRelationships(id);

  const sims = await database.getAllSims();

  if (!sim) {
    return notFound();
  }

  return (
    <>
      <h1>Edit Sim</h1>

      <div className="mb-4">
        <Link href="/admin/sims">Back</Link>
      </div>

      <EditSimForm
        sims={sims}
        ages={ages}
        lifeStates={lifeStates}
        careerBranches={careerBranches}
        relationshipTypes={relationshipTypes}
        childAspirations={childAspirations}
        teenAspirations={teenAspirations}
        adultAspirations={adultAspirations}
        infantTraits={infantTraits}
        toddlerTraits={toddlerTraits}
        childTraits={childTraits}
        teenTraits={teenTraits}
        adultTraits={adultTraits}
        sim={sim}
        simAspirations={simAspirations}
        simTraits={simTraits}
        simCareerBranches={simCareerBranches}
        simImages={simImages}
        simRelationships={simRelationships}
      />
    </>
  );
}
