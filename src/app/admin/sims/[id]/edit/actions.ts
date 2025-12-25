"use server";

import database, {
  AgeId,
  AspirationId,
  CareerBranchId,
  LifeStateId,
  TraitId,
} from "@/clients/database";
import storage from "@/clients/storage";
import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";

export async function updateSim(
  id: string,
  {
    imageFile,
    firstName,
    lastName,
    ageId,
    lifeStateId,
    parent1Id,
    parent2Id,
    aspirations,
    traits,
    careerBranches,
    isDeceased,
    isUnplayed,
  }: {
    imageFile: File | undefined;
    firstName: string;
    lastName: string;
    ageId: AgeId;
    lifeStateId: LifeStateId;
    parent1Id: string | undefined;
    parent2Id: string | undefined;
    aspirations: { aspirationId: AspirationId; ageId: AgeId }[];
    traits: { traitId: TraitId; ageId: AgeId }[];
    careerBranches: CareerBranchId[];
    isDeceased: boolean;
    isUnplayed: boolean;
  }
) {
  let imageUri;
  if (imageFile) {
    imageUri = await storage.uploadSimImage(
      imageFile,
      `sim-${id}-${ageId}.png`
    );
    await database.upsertSimImage(id, ageId, imageUri);
  }

  await database.updateSim(id, {
    firstName,
    lastName,
    ageId,
    lifeStateId,
    parent1Id: parent1Id ?? null,
    parent2Id: parent2Id ?? null,
    isDeceased,
    isUnplayed,
  });

  await database.clearSimAspirations(id);
  await database.insertSimAspirations(id, aspirations);

  await database.clearSimTraits(id);
  await database.insertSimTraits(id, traits);

  await database.clearSimCareerBranches(id);
  await database.insertSimCareerBranches(id, careerBranches);

  revalidatePath(`admin/sims/${id}/edit`, "page");
}

export async function deleteSim(simId: string) {
  const images = await database.getSimImages(simId);
  await images.map((image) => storage.deleteSimImage(image.imageUri));

  await database.deleteSim(simId);

  const query = new URLSearchParams({
    success: "Sim deleted successfully",
  });

  redirect(`/admin/sims?${query.toString()}`);
}
