import database from "@/database";
import { notFound } from "next/navigation";
import EditSimForm from "./EditSimForm";

export default async function Page({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const id = (await params).id;
  const sim = await database.getSimById(id);

  if (!sim) {
    return notFound();
  }

  return (
    <>
      <h1>
        Edit Sim: {sim.first_name} {sim.last_name}
      </h1>
      <EditSimForm sim={sim} />
    </>
  );
}
