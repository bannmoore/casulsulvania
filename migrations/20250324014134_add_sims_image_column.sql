-- +goose Up
-- +goose StatementBegin
CREATE TABLE sims_images(
  sim_id bigint REFERENCES sims(id) ON DELETE CASCADE NOT NULL,
  age_id age_id REFERENCES ages(id) NOT NULL,
  image_uri text NOT NULL,
  updated_at timestamp NOT NULL DEFAULT now(),
  UNIQUE (sim_id, age_id)
);

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE sims_images;

-- +goose StatementEnd
