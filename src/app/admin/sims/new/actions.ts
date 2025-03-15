"use server";

import database from "@/database";

export async function addSim({
  firstName,
  lastName,
}: {
  firstName: string;
  lastName: string;
}) {
  await database.insertSim({ firstName, lastName, age: "young_adult" });
}
