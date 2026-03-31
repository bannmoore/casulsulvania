-- +goose Up
-- +goose StatementBegin
INSERT INTO life_states(id, name)
  VALUES ('alien_hybrid', 'Alien Hybrid');

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DELETE FROM life_states
WHERE id = 'alien_hybrid';

-- +goose StatementEnd
