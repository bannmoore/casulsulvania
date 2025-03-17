import database from "@/database";
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
  const aspirations = await database.getAspirations();
  const sim = await database.getSimById(id);
  const simAspirations = await database.getSimAspirations(id);

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
        sim={sim}
        ages={ages}
        lifeStates={lifeStates}
        aspirations={aspirations}
        sims={sims}
        simAspirations={simAspirations}
      />
    </>
  );
}
