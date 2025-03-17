"use server";

import database, { AgeId } from "@/database";
import { revalidatePath } from "next/cache";

export async function updateSim({
  id,
  firstName,
  lastName,
  age,
}: {
  id: string;
  firstName: string;
  lastName: string;
  age: AgeId;
}) {
  await database.updateSim(id, {
    firstName,
    lastName,
    age,
    lifeState: "normal",
    parent1Id: null,
    parent2Id: null,
    story: "",
  });

  revalidatePath(`admin/sims/${id}/edit`, "page");
}
