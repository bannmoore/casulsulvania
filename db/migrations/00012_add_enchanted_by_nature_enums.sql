-- +goose Up
-- +goose StatementBegin
-- product
ALTER TYPE product_id
  ADD VALUE IF NOT EXISTS 'enchanted_by_nature' AFTER 'businesses_and_hobbies';

-- aspirations
ALTER TYPE aspiration_category
  ADD VALUE IF NOT EXISTS 'fairy';

ALTER TYPE aspiration_id
  ADD VALUE IF NOT EXISTS 'nature_nomad';

ALTER TYPE aspiration_id
  ADD VALUE IF NOT EXISTS 'elixir_enthusiast';

ALTER TYPE aspiration_id
  ADD VALUE IF NOT EXISTS 'fairy_stories';

ALTER TYPE aspiration_id
  ADD VALUE IF NOT EXISTS 'discordant_fairy';

ALTER TYPE aspiration_id
  ADD VALUE IF NOT EXISTS 'harmonious_fairy';

-- traits
ALTER TYPE trait_id
  ADD VALUE IF NOT EXISTS 'disruptive';

ALTER TYPE trait_id
  ADD VALUE IF NOT EXISTS 'mystical';

ALTER TYPE trait_id
  ADD VALUE IF NOT EXISTS 'plant_lover';

-- life state
ALTER TYPE life_state_id
  ADD VALUE IF NOT EXISTS 'fairy';

-- careers
ALTER TYPE career_id
  ADD VALUE IF NOT EXISTS 'naturopath';

ALTER TYPE career_branch_id
  ADD VALUE IF NOT EXISTS 'naturopath_apothecurist';

ALTER TYPE career_branch_id
  ADD VALUE IF NOT EXISTS 'naturopath_lifestyle_coach';

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
-- +goose StatementEnd
