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
    age,
    lifeState,
    parent1Id,
    parent2Id,
    aspirationIds,
    traitIds,
  }: {
    firstName: string;
    lastName: string;
    age: AgeId;
    lifeState: LifeStateId;
    parent1Id: string | undefined;
    parent2Id: string | undefined;
    aspirationIds: AspirationId[];
    traitIds: TraitId[];
  }
) {
  await database.updateSim(id, {
    firstName,
    lastName,
    age,
    lifeState,
    parent1Id: parent1Id ?? null,
    parent2Id: parent2Id ?? null,
    story: "",
  });

  await database.clearSimAspirations(id);
  await database.addSimAspirations(id, aspirationIds);

  await database.clearSimTraits(id);
  await database.addSimTraits(id, traitIds);

  revalidatePath(`admin/sims/${id}/edit`, "page");
}
