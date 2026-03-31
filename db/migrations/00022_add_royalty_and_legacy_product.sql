-- +goose Up
-- +goose StatementBegin
-- products
INSERT INTO products(id, type, name, release_date)
  VALUES ('royalty_and_legacy', 'expansion_pack', 'Royalty & Legacy', '02/12/2026');

-- aspirations
INSERT INTO aspirations(id, category, ages, product, name, description)
VALUES
  --
('social_puppeteer', 'deviance', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'royalty_and_legacy', 'Social Puppeteer', 'This Sim wants to know everyone''s business and are able to extort, and expose scandals about whoever they please!');

-- careers
INSERT INTO careers(id, name, product, description)
  VALUES
    --
('noble', 'Noble', 'royalty_and_legacy', 'Crown and Court are calling, it''s time to debut! Noble Sims will take on the responsibility of ruling a Kingdom and influencing the lives of Sims all throughout the realm.');

INSERT INTO career_branches(id, career_id, name, product, description)
VALUES
  --
('noble', 'noble', 'Noble', 'royalty_and_legacy', 'Crown and Court are calling, it''s time to debut! Noble Sims will take on the responsibility of ruling a Kingdom and influencing the lives of Sims all throughout the realm.');


-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DELETE FROM careers
WHERE product = 'royalty_and_legacy';

DELETE FROM career_branches
WHERE product = 'royalty_and_legacy';

DELETE FROM aspirations
WHERE product = 'royalty_and_legacy';

DELETE FROM products
WHERE id = 'royalty_and_legacy';

-- +goose StatementEnd
