-- +goose Up
-- +goose StatementBegin
-- product
ALTER TYPE product_id
  ADD VALUE IF NOT EXISTS 'royalty_and_legacy' AFTER 'adventure_awaits';

-- aspirations
ALTER TYPE aspiration_id
  ADD VALUE IF NOT EXISTS 'social_puppeteer';

-- careers
ALTER TYPE career_id
  ADD VALUE IF NOT EXISTS 'noble';

ALTER TYPE career_branch_id
  ADD VALUE IF NOT EXISTS 'noble';

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
-- +goose StatementEnd
