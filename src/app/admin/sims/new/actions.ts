"use server";

import database, { AgeId, LifeStateId } from "@/database";

export async function addSim({
  firstName,
  lastName,
  ageId,
  lifeStateId,
  parent1Id,
  parent2Id,
}: {
  firstName: string;
  lastName: string;
  ageId: AgeId;
  lifeStateId: LifeStateId;
  parent1Id: string | undefined;
  parent2Id: string | undefined;
}) {
  await database.insertSim({
    firstName,
    lastName,
    ageId,
    lifeStateId,
    parent1Id: parent1Id ?? null,
    parent2Id: parent2Id ?? null,
    story: "",
    isDeceased: false,
  });
}
