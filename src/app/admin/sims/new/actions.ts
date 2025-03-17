"use server";

import database from "@/database";
import { AgeId } from "kysely-codegen";

export async function addSim({
  firstName,
  lastName,
  age,
}: {
  firstName: string;
  lastName: string;
  age: AgeId;
}) {
  await database.insertSim({
    firstName,
    lastName,
    age,
    lifeState: "normal",
    parent1Id: null,
    parent2Id: null,
    story: "",
  });
}
