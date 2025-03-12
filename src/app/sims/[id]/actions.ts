"use server";

import database from "@/database";
import { revalidatePath } from "next/cache";

export async function updateSim({
  id,
  firstName,
  lastName,
}: {
  id: string;
  firstName: string;
  lastName: string;
}) {
  await database.updateSim({ id, firstName, lastName });

  revalidatePath(`sims/${id}`, "page");
}
