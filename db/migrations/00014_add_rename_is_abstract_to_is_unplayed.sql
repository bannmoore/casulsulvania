-- +goose Up
-- +goose StatementBegin
ALTER TABLE sims RENAME is_abstract TO is_unplayed;

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
ALTER TABLE sims RENAME is_unplayed TO is_abstract;

-- +goose StatementEnd
