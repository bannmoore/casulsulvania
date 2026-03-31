-- +goose Up
-- +goose StatementBegin
ALTER TABLE sims ADD COLUMN is_abstract BOOLEAN NOT NULL DEFAULT FALSE;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
ALTER TABLE sims DROP COLUMN is_abstract;
-- +goose StatementEnd
