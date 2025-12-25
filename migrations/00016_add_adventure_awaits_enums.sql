-- +goose Up
-- +goose StatementBegin
-- product
ALTER TYPE product_id
  ADD VALUE IF NOT EXISTS 'adventure_awaits' AFTER 'enchanted_by_nature';

-- aspirations
ALTER TYPE aspiration_id
  ADD VALUE IF NOT EXISTS 'critter_hunter';

ALTER TYPE aspiration_id
  ADD VALUE IF NOT EXISTS 'cool_kid_on_the_block';

-- traits
ALTER TYPE trait_id
  ADD VALUE IF NOT EXISTS 'competitive';

-- life state
ALTER TYPE life_state_id
  ADD VALUE IF NOT EXISTS 'imaginary_friend';

-- careers
ALTER TYPE career_id
  ADD VALUE IF NOT EXISTS 'park_worker';

ALTER TYPE career_branch_id
  ADD VALUE IF NOT EXISTS 'park_worker_park_counselor';

ALTER TYPE career_branch_id
  ADD VALUE IF NOT EXISTS 'park_worker_park_ranger';

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
-- +goose StatementEnd
