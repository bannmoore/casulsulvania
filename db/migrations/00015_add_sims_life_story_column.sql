-- +goose Up
-- +goose StatementBegin
ALTER TABLE sims
  ADD COLUMN life_story text;

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
ALTER TABLE sims
  DROP COLUMN life_story;

-- +goose StatementEnd
