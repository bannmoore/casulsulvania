"use client";

import { ChangeEvent, FormEvent, useState } from "react";
import { sendLoginEmail } from "./actions";

export default function LoginForm() {
  const [email, setEmail] = useState("");
  const [isSuccessful, setIsSuccessful] = useState(false);
  const [error, setError] = useState("");
  const [isLoading, setLoading] = useState(false);

  async function handleSubmit(event: FormEvent) {
    event.preventDefault();

    setLoading(true);
    setIsSuccessful(false);
    setError("");

    await sendLoginEmail(email)
      .then(() => setIsSuccessful(true))
      .catch((err) => {
        // https://kentcdodds.com/blog/get-a-catch-block-error-message-with-typescript
        let message = "Unknown Error";
        if (err instanceof Error) message = err.message;

        setError(message);
      })
      .finally(() => setLoading(false));
  }

  function handleEmailChange(event: ChangeEvent<HTMLInputElement>) {
    setEmail(event.currentTarget.value);
  }

  return (
    <>
      {isSuccessful && (
        <div className="alert alert-success mb-4">Email sent.</div>
      )}
      {error && <div className="alert alert-error mb-4">{error}</div>}

      <form onSubmit={handleSubmit}>
        <input
          type="email"
          id="email"
          required
          disabled={isLoading}
          placeholder="Email"
          value={email}
          onChange={handleEmailChange}
        />
        <button type="submit">Login</button>
      </form>
    </>
  );
}
