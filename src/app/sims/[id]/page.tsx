import database from "@/clients/database";
import { notFound } from "next/navigation";
import Link from "next/link";

export default async function Page({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const id = (await params).id;

  const sim = await database.getSimById(id);
  const simAspirations = await database.getSimAspirations(id);
  const simTraits = await database.getSimTraits(id);
  const simCareerBranches = await database.getSimCareerBranches(id);

  if (!sim) {
    return notFound();
  }

  return (
    <>
      <h1>
        {sim.firstName} {sim.lastName}
      </h1>
      <div className="mb-4">
        <Link href="/">Back</Link>
      </div>

      <div>
        <p>{sim.ageId}</p>
        <p>{sim.lifeStateId}</p>
        <p>{simTraits.map((trait) => trait.traitId).join(", ")}</p>
        <p>
          {simAspirations
            .map((aspiration) => aspiration.aspirationId)
            .join(", ")}
        </p>
        <p>
          {simCareerBranches
            .map((careerBranch) => careerBranch.careerBranchId)
            .join(", ")}
        </p>
      </div>
    </>
  );
}
