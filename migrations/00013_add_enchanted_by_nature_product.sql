-- +goose Up
-- +goose StatementBegin
-- products
INSERT INTO products(id, type, name, release_date)
  VALUES ('enchanted_by_nature', 'expansion_pack', 'Enchanted by Nature', '07/10/2025');

-- aspirations
INSERT INTO aspirations(id, category, ages, product, name, description)
VALUES
  --
('nature_nomad', 'nature', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'enchanted_by_nature', 'Nature Nomad', 'This Sim embraces Natural Living and enjoys fulfilling their every need in the great outdoors.'),
('elixir_enthusiast', 'knowledge', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'enchanted_by_nature', 'Elixir Enthusiast', 'This Sim wants to learn everything there is to know about the Apothecary Skill and craft powerful Cures and Elixirs from plant-based ingredients.'),
('fairy_stories', 'fairy', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'enchanted_by_nature', 'Fairy Stories', 'This Sim wants to show the world just what kind of Fairy they can be.'),
('discordant_fairy', 'fairy', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'enchanted_by_nature', 'Discordant Fairy', 'This Sim embraces the desire to manipulate the world around them—from influencing Luck or Emotions to instantly breaking objects—and has fun doing it.'),
('harmonious_fairy', 'fairy', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'enchanted_by_nature', 'Harmonious Fairy', 'This Sim thrives when helping others. Find them Nurturing plants and animals or curing Ailments.');

-- traits
INSERT INTO traits(id, name, product, ages, description)
VALUES
  --
('disruptive', 'Disruptive', 'enchanted_by_nature', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'Disruptive Sims are driven to interact with the world by messing with it. They can spread interpersonal chaos by Giving Bad Balance Advice or stick it to nature by Disrupting Plants. Disruptive Sims build Mischief Skill faster but are slower to regain Balance than most Sims."'),
('mystical', 'Mystical', 'enchanted_by_nature', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'Feeling a strong affinity for both the natural and supernatural, Mystical Sims see higher purpose in living harmoniously in each world and sharing that with other Sims. These Sims learn Apothecary and Gardening Skills faster and have an easier time building friendships with Occult Sims. Mystical Sims can offer to Grant a Sacred Blessing to other Sims, which increases Balance for both Sims if accepted.'),
('plant_lover', 'Plant Lover', 'enchanted_by_nature', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'Plant Lover Sims treat each and every plant like the little Sim they are. Being a friend to plants is not always easy on a Plant Lover''s emotions, but luckily these Sims don''t need any skill to share their special interest, just a big heart!');

INSERT INTO trait_conflicts(trait_id, conflict_trait_id)
VALUES
  -- new
('disruptive', 'mystical'),
('disruptive', 'proper'),
('mystical', 'chased_by_death'),
('mystical', 'disruptive'),
('mystical', 'macabre'),
('mystical', 'skeptical'),
('plant_lover', 'vegetarian'),
  -- reverse
  ('proper', 'disruptive'),
('chased_by_death', 'mystical'),
('macabre', 'mystical'),
('skeptical', 'mystical'),
('vegetarian', 'plant_lover');

-- life state
INSERT INTO life_states(id, name)
  VALUES
    --
('fairy', 'Fairy');

-- careers
INSERT INTO careers(id, name, product, description)
  VALUES
    --
('naturopath', 'Naturopath', 'enchanted_by_nature', 'A Naturopath draws on deep wells of knowledge, from Crafting Elixirs to Foraging, to help other Sims feel their best. If you''re drawn to healing and balance, this career is for you! Unlock 3 career outfits, news such as Educate about Balance, additional work interactions including the ability to see ailing Sims at the home lot, traits, and decor objects—such as Everdew Wisdom Frame Pack—that are perfect for any home office.');

INSERT INTO career_branches(id, career_id, name, product, description)
VALUES
  --
('naturopath_apothecurist', 'naturopath', 'Naturopath - Apothe-curist', 'enchanted_by_nature', 'If you have embraced the art of Crafting Elixirs, the Apothe-curist track will feel like home. You will need to master your craft as you continue helping others.'),
('naturopath_lifestyle_coach', 'naturopath', 'Astronaut - Lifestyle Coach', 'enchanted_by_nature', 'Make a difference in Sims'' lives by centering fitness and nourishment, along with an emphasis on nature. Let the Lifestyle Coaching track guide you on your journey!');

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DELETE FROM products
WHERE id = 'enchanted_by_nature';

DELETE FROM aspirations
WHERE product = 'enchanted_by_nature';

DELETE FROM traits
WHERE product = 'enchanted_by_nature';

DELETE FROM life_states
WHERE id = 'fairy';

DELETE FROM careers
WHERE product = 'enchanted_by_nature';

DELETE FROM career_branches
WHERE product = 'enchanted_by_nature';

-- +goose StatementEnd
