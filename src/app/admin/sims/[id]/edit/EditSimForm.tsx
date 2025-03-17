"use client";

import { ChangeEvent, FormEvent, useState } from "react";
import SingleSelect from "@/components/ux/SingleSelect";
import { Age, AgeId, Sim } from "@/database";
import { updateSim } from "./actions";

export default function AddSimForm({
  sim,
  ages,
  sims,
}: {
  sim: Sim;
  ages: Age[];
  sims: Sim[];
}) {
  const [firstName, setFirstName] = useState(sim.firstName);
  const [lastName, setLastName] = useState(sim.lastName);
  const [age, setAge] = useState<AgeId | undefined>(sim.age);
  const [parent1Id, setParent1Id] = useState<string | undefined>(
    sim.parent1Id ?? undefined
  );
  const [parent2Id, setParent2Id] = useState<string | undefined>(
    sim.parent2Id ?? undefined
  );
  const [isSuccessful, setIsSuccessful] = useState(false);
  const [error, setError] = useState("");
  const [isLoading, setLoading] = useState(false);

  async function handleSubmit(event: FormEvent) {
    event.preventDefault();

    setLoading(true);
    setIsSuccessful(false);
    setError("");

    if (!age) {
      // TODO:
      return;
    }

    await updateSim(sim.id, {
      firstName,
      lastName,
      age,
      parent1Id,
      parent2Id,
      lifeState: "normal",
    })
      .then(() => setIsSuccessful(true))
      .catch((err) => {
        // https://kentcdodds.com/blog/get-a-catch-block-error-message-with-typescript
        let message = "Unknown Error";
        if (err instanceof Error) message = err.message;

        setLoading(false);
        setError(message);
      })
      .finally(() => setLoading(false));
  }

  return (
    <>
      {isSuccessful && (
        <div className="alert alert-success mb-4">Updated successfully.</div>
      )}
      {error && <div className="alert alert-error mb-4">{error}</div>}

      <form onSubmit={handleSubmit}>
        <div className="flex gap-2 mb-4">
          <input
            type="text"
            id="first_name"
            required
            placeholder="First"
            value={firstName}
            onChange={(event: ChangeEvent<HTMLInputElement>) =>
              setFirstName(event.currentTarget.value)
            }
            className="flex-1"
            data-1p-ignore
          />
          <input
            type="text"
            id="last_name"
            required
            placeholder="Last"
            value={lastName}
            onChange={(event: ChangeEvent<HTMLInputElement>) =>
              setLastName(event.currentTarget.value)
            }
            className="flex-1"
            data-1p-ignore
          />
        </div>

        <div className="mb-4">
          <SingleSelect
            name="age"
            value={age}
            onChange={(newValue) => setAge(newValue)}
            options={ages}
            placeholder="Choose age"
            isRequired={true}
          />
        </div>

        <div className="flex gap-2 mb-4">
          <div className="flex-1">
            <SingleSelect
              name="parent1Id"
              value={parent1Id}
              onChange={(newValue) => setParent1Id(newValue)}
              options={sims}
              placeholder="Choose first parent"
            />
          </div>

          <div className="flex-1">
            <SingleSelect
              name="parent2Id"
              value={parent2Id}
              onChange={(newValue) => setParent2Id(newValue)}
              options={sims}
              placeholder="Choose second parent"
            />
          </div>
        </div>

        <div>
          <button type="submit" disabled={isLoading}>
            Save
          </button>
        </div>
      </form>
    </>
  );
}
