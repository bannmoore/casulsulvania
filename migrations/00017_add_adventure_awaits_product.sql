-- +goose Up
-- +goose StatementBegin
-- products
INSERT INTO products(id, type, name, release_date)
  VALUES ('adventure_awaits', 'expansion_pack', 'Adventure Awaits', '10/02/2025');

-- aspirations
INSERT INTO aspirations(id, category, ages, product, name, description)
VALUES
  --
('critter_hunter', 'nature', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'adventure_awaits', 'Critter Hunter', 'This Sim wants to explore the rich worlds of butterflies and fish to learn all they can about critters!'),
('cool_kid_on_the_block', 'child', ARRAY['child']::age_id[], 'adventure_awaits', 'Cool Kid on the Block', 'This Sim wants to be known as the coolest kid in the neighborhood!');

-- traits
INSERT INTO traits(id, name, product, ages, description)
  VALUES
    --
('competitive', 'Competitive', 'adventure_awaits', ARRAY['child', 'teen', 'young_adult', 'adult', 'elder']::age_id[], 'Competitive Sims have to be the best at anything they put their sweaty focus on, especially games and physical activities. They''re all about winning, so they take losing really personally. Depending on how they manage their Competitive Spirit, these Sims can either become an inspiration for Sim excellence or bask in the toxic pits of the abyss and become the ultimate sore loser!');

INSERT INTO trait_conflicts(trait_id, conflict_trait_id)
  VALUES
    -- new
('competitive', 'lazy'),
    -- reverse
    ('lazy', 'competitive');

-- life state
INSERT INTO life_states(id, name)
  VALUES
    --
('imaginary_friend', 'Imaginary Friend');

-- careers
INSERT INTO careers(id, name, product, description)
  VALUES
    --
('park_worker', 'Park Worker', 'adventure_awaits', 'Not your typical 9-to-5. Out here, shifts can stretch across days, and every task helps keep the camp running. Whether you''re scrubbing cabins or or guiding curious campers, your days (and nights) will be spent deep in Miceli Park, turning wilderness into something that feels like home! Miceli Park is a tougher post than Camp Gibbi Gibbi. It''s secluded and rugged, and reached only by those brave enough to take the trail less traveled beyond the Ranger Station.');

INSERT INTO career_branches(id, career_id, name, product, description)
VALUES
  --
('park_worker_park_counselor', 'park_worker', 'Park Worker - Park Counselor', 'adventure_awaits', 'While some manage the nature side of camp, Park Counselors manage the campers. Whether calming down a homesick kid or leading activity classes for restless kids, this branch ensures you become the one campers look up to!'),
('park_worker_park_ranger', 'park_worker', 'Park Worker - Park Ranger', 'adventure_awaits', 'Do you keep it cool when things get wild and keep a wrench in their back pocket just in case? Then Park Ranger might be the perfect fit. With practical know-how, steady focus, and a deep respect for the woods, you''re ready to take the lead when nature calls.');

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DELETE FROM career_branches
WHERE product = 'adventure_awaits';

DELETE FROM careers
WHERE product = 'adventure_awaits';

DELETE FROM life_states
WHERE id = 'imaginary_friend';

DELETE FROM traits
WHERE product = 'adventure_awaits';

DELETE FROM aspirations
WHERE product = 'adventure_awaits';

DELETE FROM products
WHERE id = 'adventure_awaits';

-- +goose StatementEnd
