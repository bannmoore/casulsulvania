-- +goose Up
-- +goose StatementBegin
CREATE TYPE relationship_type_id AS ENUM(
  'spouse',
  'romantic_partner',
  'woohoo_partner'
);

CREATE TABLE relationship_types(
  id relationship_type_id PRIMARY KEY,
  name text NOT NULL
);

INSERT INTO relationship_types(id, name)
VALUES
  --
('spouse', 'Spouse'),
('romantic_partner', 'Romantic Partner'),
('woohoo_partner', 'Woohoo Partner')
  --
;

CREATE TABLE sims_relationships(
  source_sim_id bigint REFERENCES sims(id) ON DELETE CASCADE NOT NULL,
  target_sim_id bigint REFERENCES sims(id) ON DELETE CASCADE NOT NULL,
  relationship_type_id relationship_type_id NOT NULL,
  UNIQUE (source_sim_id, target_sim_id),
  CHECK (source_sim_id < target_sim_id)
);

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE sims_relationships;

DROP TABLE relationship_types;

DROP TYPE relationship_type_id;

-- +goose StatementEnd
