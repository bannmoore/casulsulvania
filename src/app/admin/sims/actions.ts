"use server";

import database from "@/database";
import { revalidatePath } from "next/cache";

export async function addSim({
  firstName,
  lastName,
}: {
  firstName: string;
  lastName: string;
}) {
  await database.insertSim({ firstName, lastName });

  revalidatePath("/admin/sims");
}
