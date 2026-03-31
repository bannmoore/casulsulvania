-- +goose Up
-- +goose StatementBegin
ALTER TYPE life_state_id
  ADD VALUE IF NOT EXISTS 'alien_hybrid';

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
-- +goose StatementEnd
