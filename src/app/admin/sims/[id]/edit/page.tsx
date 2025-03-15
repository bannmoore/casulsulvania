import database from "@/database";
import { notFound } from "next/navigation";
import EditSimForm from "./EditSimForm";
import { updateSim } from "./actions";
import Link from "next/link";

export default async function Page({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const id = (await params).id;
  const sim = await database.getSimById(id);
  const ages = await database.getAges();

  if (!sim) {
    return notFound();
  }

  return (
    <>
      <h1>Edit Sim</h1>

      <div className="mb-4">
        <Link href="/admin/sims">Back</Link>
      </div>

      <EditSimForm sim={sim} submitFormAction={updateSim} ages={ages} />
    </>
  );
}
