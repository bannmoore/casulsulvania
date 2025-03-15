"use server";

import database from "@/database";
import { AgeId } from "kysely-codegen";
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
  await database.updateSim({ id, firstName, lastName, age });

  revalidatePath(`admin/sims/${id}/edit`, "page");
}
