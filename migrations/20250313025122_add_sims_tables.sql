-- +goose Up
-- +goose StatementBegin
CREATE TABLE sims(
  id bigserial PRIMARY KEY,
  first_name text NOT NULL,
  last_name text NOT NULL,
  name text GENERATED ALWAYS AS (first_name || ' ' || last_name) STORED NOT NULL,
  age_id age_id REFERENCES ages(id) NOT NULL,
  life_state_id life_State_id REFERENCES life_states(id) NOT NULL DEFAULT 'normal',
  parent1_id bigint REFERENCES sims,
  parent2_id bigint REFERENCES sims,
  story text NOT NULL DEFAULT '',
  is_deceased boolean NOT NULL DEFAULT FALSE,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now()
);

CREATE TABLE sims_aspirations(
  sim_id bigint REFERENCES sims(id) ON DELETE CASCADE NOT NULL,
  aspiration_id aspiration_id REFERENCES aspirations(id) NOT NULL,
  age_id age_id REFERENCES ages(id) NOT NULL,
  is_complete boolean NOT NULL DEFAULT FALSE,
  UNIQUE (sim_id, aspiration_id)
);

CREATE TABLE sims_traits(
  sim_id bigint REFERENCES sims(id) ON DELETE CASCADE NOT NULL,
  trait_id trait_id REFERENCES traits(id) NOT NULL,
  age_id age_id REFERENCES ages(id) NOT NULL,
  UNIQUE (sim_id, trait_id)
);

CREATE TABLE sims_career_branches(
  sim_id bigint REFERENCES sims(id) ON DELETE CASCADE NOT NULL,
  career_branch_id career_branch_id REFERENCES career_branches(id) NOT NULL,
  UNIQUE (sim_id, career_branch_id)
);

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE sims_career_branches;

DROP TABLE sims_traits;

DROP TABLE sims_aspirations;

DROP TABLE sims;

-- +goose StatementEnd
