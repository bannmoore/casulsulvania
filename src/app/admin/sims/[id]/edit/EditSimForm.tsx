"use client";

import { ChangeEvent, FormEvent, useState } from "react";
import SingleSelect from "@/components/ux/SingleSelect";
import { Age, AgeId, Sim } from "@/database";

export default function AddSimForm({
  sim,
  submitFormAction,
  ages,
}: {
  sim: Sim;
  submitFormAction: ({
    id,
    firstName,
    lastName,
    age,
  }: {
    id: string;
    firstName: string;
    lastName: string;
    age: AgeId;
  }) => Promise<void>;
  ages: Age[];
}) {
  const [firstName, setFirstName] = useState(sim.firstName);
  const [lastName, setLastName] = useState(sim.lastName);
  const [age, setAge] = useState<AgeId | undefined>(sim.age);
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

    await submitFormAction({ id: sim.id, firstName, lastName, age })
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

        <div>
          <button type="submit" disabled={isLoading}>
            Save
          </button>
        </div>
      </form>
    </>
  );
}
