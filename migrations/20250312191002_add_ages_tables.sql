-- +goose Up
-- +goose StatementBegin
CREATE TYPE age_id AS ENUM(
        'newborn',
        'infant',
        'toddler',
        'child',
        'teen',
        'young_adult',
        'adult',
        'elder'
);

CREATE TABLE ages(
        id age_id PRIMARY KEY,
        name text NOT NULL
);

INSERT INTO ages(id, name)
        VALUES
                -- ages
('newborn', 'Newborn'),
('infant', 'Infant'),
('toddler', 'Toddler'),
('child', 'Child'),
('teen', 'Teen'),
('young_adult', 'Young Adult'),
('adult', 'Adult'),
('elder', 'Elder');

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE ages;

DROP TYPE age_id;

-- +goose StatementEnd
