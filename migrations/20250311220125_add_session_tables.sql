-- +goose Up
-- +goose StatementBegin
-- REFERENCE: https://authjs.dev/getting-started/adapters/kysely?framework=next-js
CREATE TABLE users(
  id bigserial PRIMARY KEY,
  email text UNIQUE NOT NULL,
  is_test_user boolean NOT NULL DEFAULT FALSE,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now()
);

INSERT INTO users(email)
  VALUES ('moore.brittanyann@gmail.com');

CREATE TABLE sessions(
  id bigserial PRIMARY KEY,
  user_id bigint REFERENCES users ON DELETE CASCADE NOT NULL,
  token text NOT NULL,
  expires_at timestamp NOT NULL,
  created_at timestamp NOT NULL DEFAULT now()
);

CREATE TABLE otps(
  otp text NOT NULL,
  email text NOT NULL,
  expires_at timestamp NOT NULL,
  created_at timestamp NOT NULL DEFAULT now()
);

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE otps;

DROP TABLE sessions;

DROP TABLE users;

-- +goose StatementEnd
