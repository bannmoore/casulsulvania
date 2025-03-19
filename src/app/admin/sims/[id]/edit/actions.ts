"use server";

import database, {
  AgeId,
  AspirationId,
  LifeStateId,
  TraitId,
} from "@/database";
import { revalidatePath } from "next/cache";

export async function updateSim(
  id: string,
  {
    firstName,
    lastName,
    ageId,
    lifeStateId,
    parent1Id,
    parent2Id,
    aspirations,
    traits,
  }: {
    firstName: string;
    lastName: string;
    ageId: AgeId;
    lifeStateId: LifeStateId;
    parent1Id: string | undefined;
    parent2Id: string | undefined;
    aspirations: { aspirationId: AspirationId; ageId: AgeId }[];
    traits: { traitId: TraitId; ageId: AgeId }[];
  }
) {
  await database.updateSim(id, {
    firstName,
    lastName,
    ageId,
    lifeStateId,
    parent1Id: parent1Id ?? null,
    parent2Id: parent2Id ?? null,
  });

  await database.clearSimAspirations(id);
  await database.insertSimAspirations(id, aspirations);

  await database.clearSimTraits(id);
  await database.insertSimTraits(id, traits);

  revalidatePath(`admin/sims/${id}/edit`, "page");
}
