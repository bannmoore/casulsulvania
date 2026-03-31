-- +goose Up
-- +goose StatementBegin
CREATE TYPE aspiration_id AS ENUM(
        -- Child
        'child_artistic_prodigy',
        'child_rambunctious_scamp',
        'child_social_butterfly',
        'child_whiz_kid',
        'child_slumber_party_animal',
        'child_mind_and_body',
        'child_playtime_captain',
        'child_creative_genius',
        -- Teen
        'teen_drama_llama',
        'teen_goal_oriented',
        'teen_live_fast',
        'teen_admired_icon',
        -- Animal
        'friend_of_the_animals',
        -- Athletic
        'bodybuilder',
        'extreme_sports_enthusiast',
        'championship_rider',
        -- Creativity
        'painter_extraordinaire',
        'musical_genius',
        'bestselling_author',
        'master_actor_actress',
        'master_maker',
        'lord_lady_of_the_knits',
        -- Deviance
        'public_enemy',
        'chief_of_mischief',
        'villainous_valentine',
        'seeker_of_secrets',
        'sticky_fingers',
        -- Family
        'successful_lineage',
        'big_happy_family',
        'vampire_family',
        'super_parent',
        -- Food
        'master_chef',
        'master_mixologist',
        'expert_nectar_maker',
        'appliance_whiz',
        'grilled_cheese',
        -- Fortune
        'fabulously_wealthy',
        'mansion_baron',
        'market_magnate',
        'five_star_property_owner',
        -- Knowledge
        'renaissance_sim',
        'nerd_brain',
        'computer_whiz',
        'master_vampire',
        'archaeology_scholar',
        'spellcraft_and_sorcery',
        'academic',
        'ghost_historian',
        'master_mentor',
        -- Location
        'city_native',
        'strangerville_mystery',
        'beach_life',
        'Location',
        'mt_komorebi_sightsser',
        'perfectly_pristine',
        'fabulously_filthy',
        'fount_of_tomarani_knowledge',
        -- Love
        'serial_romantic',
        'soulmate',
        'Love',
        'romantic_explorer',
        'paragon_partner',
        -- Nature
        'freelance_botanist',
        'the_curator',
        'angling_ace',
        'outdoor_enthusiast',
        'jungle_explorer',
        'purveyor_of_potions',
        'eco_innovator',
        'country_caretaker',
        'crystal_crafter',
        -- Popularity
        'joke_star',
        'party_animal',
        'friend_of_the_world',
        'neighborhood_confidant',
        'leader_of_the_pack',
        'good_vampire',
        'world_famous_celebrity',
        'discerning_dweller',
        'esteemed_entrepreneur',
        -- Star Wars
        'hope_vs_order',
        'paragon_of_hope',
        'enforcer_of_order',
        'galactic_privateer',
        -- Wellness
        'inner_peace',
        'self_care_specialist',
        'zen_guru',
        -- Werewolf
        'werewolf_initiate',
        'lone_wolf',
        'emissary_of_the_collective',
        'wildfang_renegade',
        'cure_seeker'
        --
);

CREATE TYPE aspiration_category AS ENUM(
        'child',
        'teen',
        'animal',
        'athletic',
        'creativity',
        'deviance',
        'family',
        'food',
        'fortune',
        'knowledge',
        'location',
        'love',
        'nature',
        'popularity',
        'star_wars',
        'wellness',
        'werewolf'
        --
);

CREATE TABLE aspirations(
        id aspiration_id PRIMARY KEY,
        name text NOT NULL,
        category aspiration_category NOT NULL,
        ages age_id[] NOT NULL DEFAULT ARRAY[]::age_id[],
        description text NOT NULL,
        product product_id REFERENCES products(id) NOT NULL
);

INSERT INTO aspirations(id, category, ages, product, name, description)
VALUES
        -- Child
('child_artistic_prodigy', 'child', ARRAY['child']::age_id[], 'base', 'Artistic Prodigy', 'This Sim has dreams of succeeding in the arts!'),
('child_rambunctious_scamp', 'child', ARRAY['child']::age_id[], 'base', 'Rambunctious Scamp', 'This Sim wants to be playful and nimble!'),
('child_social_butterfly', 'child', ARRAY['child']::age_id[], 'base', 'Social Butterfly', 'This Sim wants to talk to everyone and make friends!'),
('child_whiz_kid', 'child', ARRAY['child']::age_id[], 'base', 'Whiz Kid', 'This Sim wants to be the smartest kid in school!'),
('child_slumber_party_animal', 'child', ARRAY['child']::age_id[], 'growing_together', 'Slumber Party Animal', 'This Sim wants to be the life of the party - in a uniquely creative way!'),
('child_mind_and_body', 'child', ARRAY['child']::age_id[], 'growing_together', 'Mind and Body', 'This Sim wants to master both their mind and body!'),
('child_playtime_captain', 'child', ARRAY['child']::age_id[], 'growing_together', 'Playtime Captain', 'This Sim loves to seek out active play - with friends!'),
('child_creative_genius', 'child', ARRAY['child']::age_id[], 'growing_together', 'Creative Genius', 'This Sim wants to build their creative and mental skills to inspire innovation and play!'),
        -- Teen
('teen_drama_llama', 'teen', ARRAY['teen']::age_id[], 'high_school_years', 'Drama LLama', 'This Sim wants all the drama all the time.'),
('teen_goal_oriented', 'teen', ARRAY['teen']::age_id[], 'high_school_years', 'Goal Oriented', 'This Sim wants to be the best: Grades? Check. Sports? Check. Money? Check! The road to success is being paved!'),
('teen_live_fast', 'teen', ARRAY['teen']::age_id[], 'high_school_years', 'Live Fast', 'This Sim aims to get the most out of live by living care-free and rules-free.'),
('teen_admired_icon', 'teen', ARRAY['teen']::age_id[], 'high_school_years', 'Admired Icon', 'This Sim wants to be a trend setter, popular, and influential. A true icon.'),
        -- Animal
('friend_of_the_animals', 'animal', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'cats_and_dogs', 'Friend of the Animals', 'This Sim wants to be friends with the animals.'),
        -- Athletic
('bodybuilder', 'athletic', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Bodybuilder', 'This Sim wants to work out and become as strong as they can be!'),
('extreme_sports_enthusiast', 'athletic', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'snowy_escape', 'Extreme Sports Enthusiast', 'This Sim wants to explore Mt. Komorebi''s wilderness and participate in extreme snow sports.'),
('championship_rider', 'athletic', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'horse_ranch', 'Championship Rider', 'This Sim wants to be one of the world''s premiere Horse Riders and will prove it by participating in Horse Competitions.'),
        -- Creativity
('painter_extraordinaire', 'creativity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Painter Extraordinaire', 'This Sim wants his/her life to be all about art and painting!'),
('musical_genius', 'creativity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Musical Genius', 'This Sim wants to be an expert musician and songwriter!'),
('bestselling_author', 'creativity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Bestselling Author', 'This Sim wants to write books and become a famous author!'),
('master_actor_actress', 'creativity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'get_famous', 'Master Actor/Master Actress', 'This Sim wants to hone their craft and become an acclaimed actor/actress!'),
('master_maker', 'creativity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'eco_lifestyle', 'Master Maker', 'This Sim wants to become an expert at Fabrication!'),
('lord_lady_of_the_knits', 'creativity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'nifty_knitting', 'Lord/Lady of the Knits', 'This Sim has yarn running through his/her veins and will stop at nothing on his/her quest to craft the perfect knittable!'),
        -- Deviance
('public_enemy', 'deviance', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Public Enemy', 'This Sim wants to make enemies and be a famous criminal!'),
('chief_of_mischief', 'deviance', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Chief of Mischief', 'This Sim is all about pranks and mayhem!'),
('villainous_valentine', 'deviance', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Villainous Valentine', 'This Sim wants to destroy the love lives of all Sims, including their own!'),
('seeker_of_secrets', 'deviance', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'for_rent', 'Seeker of Secrets', 'This Sim loves the thrill of discovering juicy Secrets about other Sims. What they do with that information has yet to be decided...'),
('sticky_fingers', 'deviance', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'blast_from_the_past', 'Sticky Fingers', 'This Sim wants to become a master procurer and redistributor of goods and wealth to their own pocket.'),
        -- Family
        ('successful_lineage', 'family', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Successful Lineage', 'This Sim wants to have a family that succeeds in life!'),
('big_happy_family', 'family', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Big Happy Family', 'This Sim wants to build a large, loving household!'),
('vampire_family', 'family', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'vampires', 'Vampire Family', 'This Sim wants to have a family of Vampires!'),
('super_parent', 'family', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'parenthood', 'Super Parent', 'This Sim wants to be the best parent ever!'),
        -- Food
('master_chef', 'food', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Master Chef', 'This Sim wants to master the Culinary Arts!'),
('master_mixologist', 'food', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Master Mixologist', 'This Sim wants to know everything there is to know about Mixology!'),
('expert_nectar_maker', 'food', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'horse_ranch', 'Expert Nectar Maker', 'This Sim wants to master the art of Nectar Making, honing their abilities to consistently craft only the best Nectars. They also want to make an absurd amount of Simoleons doing it.'),
('appliance_whiz', 'food', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'home_chef_hustle', 'Appliance Wiz', 'This Sim knows their way around the small kitchen appliances!'),
('grilled_cheese', 'food', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Grilled Cheese', 'This Sim wants to eat, discuss, sleep, dream, and live grilled cheese sandwiches.'),
        -- Fortune
('fabulously_wealthy', 'fortune', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Fabulously Wealthy', 'This Sim wants to get rich and have a successful career!'),
('mansion_baron', 'fortune', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Mansion Baron', 'This Sim is all about owning the biggest, fanciest home!'),
('market_magnate', 'fortune', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'home_chef_hustle', 'Market Magnate', 'This sim wants to operate the most profitable Food Stand!'),
('five_star_property_owner', 'fortune', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'for_rent', 'Five-Star Property Owner', 'This sim wants to be the best Property Owner the world has ever seen!'),
        -- Knowledge
('renaissance_sim', 'knowledge', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Renaissance Sim', 'This sim wants to be good at many things at once!'),
('nerd_brain', 'knowledge', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Nerd Brain', 'This sim wants to be both book smart and handy!'),
('computer_whiz', 'knowledge', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Computer Whiz', 'This sim wants to know everything about computers, from playing games to Careers!'),
('master_vampire', 'knowledge', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'vampires', 'Master Vampire', 'This sim wants to become a wise and power Vampire!'),
('archaeology_scholar', 'knowledge', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'jungle_adventure', 'Archaeology Scholar', 'This sim wants to understand Archaeology. Sims who select this Aspiration will complete a series of actions related to the Archaeology Skill.'),
('spellcraft_and_sorcery', 'knowledge', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'realm_of_magic', 'Spellcraft & Sorcery', 'This Sim craves a deep knowledge of the arcane magical arts.'),
('academic', 'knowledge', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'discover_university', 'Academic', 'This sim wants to attend university and get a job, but most importantly – learn!'),
('ghost_historian', 'knowledge', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'life_and_death', 'Ghost Historian', 'This sim wants to learn everything about ghosts and use the findings to write spooky horror novels!'),
('master_mentor', 'knowledge', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'businesses_and_hobbies', 'Master Mentor', 'This sim wants to learn from talented mentors, then pass that knowledge on to others.'),
        -- Location
('city_native', 'location', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'city_living', 'City Native', 'This sim is all about the city life.'),
('strangerville_mystery', 'location', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'strangerville', 'StrangerVille Mystery', 'StrangerVille IS holding SOME deep dark secret, AND this Sim wants TO uncover why ALL the townsfolk are acting a bit strange.'),
('beach_life', 'location', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'island_living', 'Beach Life', 'This sim wants to take it slow and enjoy beach life.'),
('mt_komorebi_sightsser', 'location', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'snowy_escape', 'Mt. Komorebi Sightseer', 'This sim wants to explore Mt. Komorebi''s culture and experience everything it has to offer.'),
('perfectly_pristine', 'location', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'bust_the_dust', 'Perfectly Pristine', 'This sim likes their home to be presentable and clean all the time. Taking pride in their pristine homes, these Sims shoot for perfection and thrive when they have a spotless house to show off to guests.'),
('fabulously_filthy', 'location', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'bust_the_dust', 'Fabulously Filthy', 'This sim revels in filthy, messy homes and avoids cleaning at all costs. Procrastinate, dodge chores, lower your standards, and find creative ways to thrive in the filthiest environments!'),
('fount_of_tomarani_knowledge', 'location', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'for_rent', 'Fount of Tomarani Knowledge', 'This sim wants to immerse themselves in everything Tomarang has to offer!'),
        -- Love
('serial_romantic', 'love', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Serial Romantic', 'This Sim wants to play the field and go on all sorts of dates with people!'),
('soulmate', 'love', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Soulmate', 'This Sim wants to find and live a rewarding life with "The One"!'),
('romantic_explorer', 'love', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'lovestruck', 'Romantic Explorer', 'This sim wants to explore all that romance has to offer.'),
('paragon_partner', 'love', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'lovestruck', 'Paragon Partner', 'This sim wants to have successful relationships with two or more Sims.'),
        -- Nature
('freelance_botanist', 'nature', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Freelance Botanist', 'This sim wants to grow plants and become an expert Gardener!'),
('the_curator', 'nature', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'The Curator', 'This sim wants to collect everything this world has to offer!'),
('angling_ace', 'nature', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Angling Ace', 'This sim wants to know everything about fishing!'),
('outdoor_enthusiast', 'nature', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'outdoor_retreat', 'Outdoor Enthusiast', 'Outdoor Enthusiasts want to experience everything nature has to offer!'),
('jungle_explorer', 'nature', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'jungle_adventure', 'Jungle Explorer', 'This sim wants to explore the jungle! Sims who select this Aspiration will complete a series of actions related to the exploration.'),
('purveyor_of_potions', 'nature', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'realm_of_magic', 'Purveyor of Potions', 'This sim wants to learn every potion''s recipe and craft each one!'),
('eco_innovator', 'nature', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'eco_lifestyle', 'Eco Innovator', 'This sim wants to build a better, greener community.'),
('country_caretaker', 'nature', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'cottage_living', 'Country Caretaker', 'Country Caretakers want to tend the countryside and befriend all animals and critters!'),
('crystal_crafter', 'nature', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'crystal_creations', 'Crystal Crafter', 'This sim wants to cut gemstones, craft jewelry, and harness the power of the crystals!'),
        -- Popularity
('joke_star', 'popularity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Joke Star', 'This sim wants to tell jokes and become an famous comedian!'),
('party_animal', 'popularity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Party Animal', 'This sim wants to throw and attend amazing parties!'),
('friend_of_the_world', 'popularity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Friend of the World', 'This sim wants to make and keep as many friends as they can!'),
('neighborhood_confidant', 'popularity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'base', 'Neighborhood Confidante', 'This sim wants to provide all manner of advice, to be a positive influence in the lives of their neighbors.'),
('leader_of_the_pack', 'popularity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'get_together', 'Leader of the Pack', 'This sim wants to be the leader of the best Club in Town!'),
('good_vampire', 'popularity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'vampires', 'Good Vampire', 'This sim wants to tame his/her thirst and remain as human as possible!'),
('world_famous_celebrity', 'popularity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'get_famous', 'World-Famous Celebrity', 'This sim wants to become illustriously famous.'),
('discerning_dweller', 'popularity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'for_rent', 'Discerning Dweller', 'This sim aspires to be the perfect Tenant and neighbor in a Residential Rental!'),
('esteemed_entrepreneur', 'popularity', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'businesses_and_hobbies', 'Esteemed Entrepreneur', 'This sim wants to run a small business full of happy customers, either through business practices rooted in idealistic dreams or tricky hustles based on pragmatic schemes'),
        -- Star Wars
('hope_vs_order', 'star_wars', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'star_wars_journey_to_batuu', 'Hope VS Order', 'On the world of Batuu there is a growing conflict. This Sim is out to explore Black Spire Outpost and understand whether they should stand with the Resistance of the First Order.'),
('paragon_of_hope', 'star_wars', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'star_wars_journey_to_batuu', 'Paragon of Hope', 'This sim looks to be the spark of hope that disrupts the First Order''s operations on Batuu and aid the Resistance cause.'),
('enforcer_of_order', 'star_wars', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'star_wars_journey_to_batuu', 'Enforcer of Order', 'This sim is out to prove their loyalty to the First Order by stamping out the Resistance presence on Batuu.'),
('galactic_privateer', 'star_wars', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'star_wars_journey_to_batuu', 'Galactic Privateer', 'This sim isn''t about choosing sides, they''re happy just mingling among the smugglers, and bounty hunters on the fringe planet of Batuu. Earning a few extra credits along the way is just a bonus, no matter how they get them.'),
        -- Wellness
('inner_peace', 'wellness', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'spa_day', 'Inner Peace', 'This sim is on quest to achieve Inner Peace. Although true harmony is sometimes ephemeral, what''s important IS developing tools TO help mitigate negative emotions.'),
('self_care_specialist', 'wellness', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'spa_day', 'Self-Care Specialist', 'This sim wants to make it big with monetizing Wellness activities like offering Manicures or Tending the Massage Table at Spa.'),
('zen_guru', 'wellness', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'spa_day', 'Zen Guru', 'This sim wants to share their mastery of Wellness with the world, and train a successor to pass on their knowledge.'),
        -- Werewolf
('werewolf_initiate', 'werewolf', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'werewolves', 'Werewolf Initiate', 'This Sim wants to unleash his/her inner beast and become a werewolf!'),
('lone_wolf', 'werewolf', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'werewolves', 'Lone Wolf', 'This Sim wants to become the strongest and most feared werewolf, all on his/her own!'),
('emissary_of_the_collective', 'werewolf', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'werewolves', 'Emissary of the Collective', 'This sim wants to join The Moonwood Collective and become a friendly ambassador to all!'),
('wildfang_renegade', 'werewolf', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'werewolves', 'Wildfang Renegade', 'This Sim wants to join the Wildfangs and unapologetically take on the world as a Werewolf!'),
('cure_seeker', 'werewolf', ARRAY['teen', 'young_adult', 'adult', 'elder']::age_id[], 'werewolves', 'Cure Seeker', 'This Sim seeks a cure for lycanthropy to live his/her life as a non-werewolf Sim.');

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE aspirations;

DROP TYPE aspiration_category;

DROP TYPE aspiration_id;

-- +goose StatementEnd
