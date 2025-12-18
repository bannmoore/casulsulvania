import database from "@/clients/database";
import { notFound } from "next/navigation";
import Link from "next/link";
import ViewSim from "./ViewSim";
import storage from "@/clients/storage";

export default async function Page({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const id = (await params).id;

  const sim = await database.getSimById(id);
  const simTraits = await database.getSimTraits(id);
  const simImages = await database.getSimImages(id);

  const simTraitsWithImages = simTraits.map((trait) => ({
    ...trait,
    imageSrc: storage.getTraitImage(trait.traitId),
  }));

  if (!sim) {
    return notFound();
  }

  return (
    <>
      <div className="mb-4">
        <Link href="/">Back</Link>
      </div>

      <ViewSim
        sim={sim}
        simTraits={simTraitsWithImages}
        simImages={simImages}
      />
    </>
  );
}
