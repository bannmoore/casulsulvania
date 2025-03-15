"use client";

import { useRouter } from "next/navigation";
import { ChangeEvent, FormEvent, useState } from "react";

export default function AddSimForm({
  submitFormAction,
}: {
  submitFormAction: ({
    firstName,
    lastName,
  }: {
    firstName: string;
    lastName: string;
  }) => Promise<void>;
}) {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [error, setError] = useState("");
  const [isLoading, setLoading] = useState(false);

  const router = useRouter();

  async function handleSubmit(event: FormEvent) {
    event.preventDefault();

    setLoading(true);
    setError("");

    await submitFormAction({ firstName, lastName })
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
            id="first_name"
            required
            placeholder="First Name"
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
            placeholder="Last Name"
            value={lastName}
            onChange={(event: ChangeEvent<HTMLInputElement>) =>
              setLastName(event.currentTarget.value)
            }
            data-1p-ignore
          />
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
