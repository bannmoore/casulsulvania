"use client";

import { ChangeEvent, FormEvent, useState } from "react";
import { addSim } from "./actions";

export default function AddSimForm() {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [isSuccessful, setIsSuccessful] = useState(false);
  const [error, setError] = useState("");
  const [isLoading, setLoading] = useState(false);

  async function handleSubmit(event: FormEvent) {
    event.preventDefault();

    setLoading(true);
    setIsSuccessful(false);
    setError("");

    await addSim({ firstName, lastName })
      .then(() => setIsSuccessful(true))
      .catch((err) => {
        // https://kentcdodds.com/blog/get-a-catch-block-error-message-with-typescript
        let message = "Unknown Error";
        if (err instanceof Error) message = err.message;

        setError(message);
      })
      .finally(() => setLoading(false));
  }

  return (
    <>
      {isSuccessful && <div className="alert alert-success mb-4">Added.</div>}
      {error && <div className="alert alert-error mb-4">{error}</div>}

      <form onSubmit={handleSubmit}>
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
        <button type="submit" disabled={isLoading}>
          Add
        </button>
      </form>
    </>
  );
}
