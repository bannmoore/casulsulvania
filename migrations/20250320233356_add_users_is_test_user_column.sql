-- +goose Up
-- +goose StatementBegin
ALTER TABLE users
  ADD COLUMN is_test_user boolean NOT NULL DEFAULT FALSE;

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
ALTER TABLE users
  DROP COLUMN is_test_user;

-- +goose StatementEnd
