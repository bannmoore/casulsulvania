"use client";

import SingleSelect from "@/components/ux/SingleSelect";
import { Age, AgeId, LifeState, LifeStateId, Sim } from "@/clients/database";
import { useRouter } from "next/navigation";
import { ChangeEvent, FormEvent, useState } from "react";
import { addSim } from "./actions";

export default function AddSimForm({
  ages,
  lifeStates,
  sims,
}: {
  ages: Age[];
  lifeStates: LifeState[];
  sims: Sim[];
}) {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [ageId, setAgeId] = useState<AgeId>();
  const [parent1Id, setParent1Id] = useState<string>();
  const [parent2Id, setParent2Id] = useState<string>();
  const [lifeStateId, setLifeStateId] = useState<LifeStateId | undefined>(
    "normal"
  );
  const [error, setError] = useState("");
  const [isLoading, setLoading] = useState(false);

  const router = useRouter();

  async function handleSubmit(event: FormEvent) {
    event.preventDefault();

    setLoading(true);
    setError("");

    // TODO
    if (!ageId || !lifeStateId) {
      return;
    }

    await addSim({
      firstName,
      lastName,
      ageId,
      parent1Id,
      parent2Id,
      lifeStateId,
    })
      .then(() => router.push("/admin/sims"))
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
      {error && <div className="alert alert-error mb-4">{error}</div>}

      <form onSubmit={handleSubmit}>
        <div className="flex gap-2 mb-4">
          <input
            type="text"
            id="firstName"
            required
            placeholder="First Name"
            value={firstName}
            onChange={(event: ChangeEvent<HTMLInputElement>) =>
              setFirstName(event.currentTarget.value)
            }
            className="flex-1"
            data-1p-ignore
          />
          <input
            type="text"
            id="lastName"
            required
            placeholder="Last Name"
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
            name="lifeState"
            value={lifeStateId}
            onChange={(newValue) => setLifeStateId(newValue)}
            options={lifeStates}
            placeholder="Choose life state"
            isRequired={true}
          />
        </div>

        <div className="mb-4">
          <SingleSelect
            name="age"
            value={ageId}
            onChange={(newValue) => setAgeId(newValue)}
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
              isSearchable={true}
            />
          </div>

          <div className="flex-1">
            <SingleSelect
              name="parent2Id"
              value={parent2Id}
              onChange={(newValue) => setParent2Id(newValue)}
              options={sims}
              placeholder="Choose second parent"
              isSearchable={true}
            />
          </div>
        </div>

        <div>
          <button type="submit" disabled={isLoading} className="mr-4">
            Add
          </button>

          <button
            type="button"
            disabled={isLoading}
            onClick={() => router.push("/admin/sims")}
          >
            Cancel
          </button>
        </div>
      </form>
    </>
  );
}
