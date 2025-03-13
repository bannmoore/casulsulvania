-- +goose Up
-- +goose StatementBegin
CREATE TYPE product_id AS ENUM(
        -- expansions
        'base',
        'get_to_work',
        'get_together',
        'city_living',
        'cats_and_dogs',
        'seasons',
        'get_famous',
        'island_living',
        'discover_university',
        'eco_lifestyle',
        'snowy_escape',
        'cottage_living',
        'high_school_years',
        'growing_together',
        'horse_ranch',
        'for_rent',
        'lovestruck',
        'life_and_death',
        'businesses_and_hobbies',
        -- game packs
        'outdoor_retreat',
        'spa_day',
        'dine_out',
        'vampires',
        'parenthood',
        'jungle_adventure',
        'strangerville',
        'realm_of_magic',
        'star_wars_journey_to_batuu',
        'dream_home_decorator',
        'my_wedding_stories',
        'werewolves',
        -- stuff packs
        'luxury_party',
        'perfect_patio',
        'cool_kitchen',
        'spooky',
        'movie_hangout',
        'romantic_garden',
        'kids_room',
        'backyard',
        'vintage_glamour',
        'bowling_night',
        'fitness',
        'toddler',
        'laundry_day',
        'my_first_pet',
        'moschino',
        'tiny_living',
        'nifty_knitting',
        'paranormal',
        'home_chef_hustle',
        'crystal_creations',
        -- kits
        'throwback_fit',
        'country_kitchen',
        'bust_the_dust',
        'courtyard_oasis',
        'modern_menswear',
        'carnaval_streetwear',
        'decor_to_the_max',
        'moonlight_chic',
        'little_campers',
        'first_fits',
        'desert_luxe',
        'pastel_pop',
        'everyday_clutter',
        'simtimates_collection',
        'bathroom_clutter',
        'greenhouse_haven',
        'basement_treasures',
        'grunge_revival',
        'book_nook',
        'poolside_splash',
        'modern_luxe',
        'goth_galore',
        'castle_estate',
        'urban_homage',
        'party_essentials',
        'riviera_retreat',
        'cozy_bistro',
        'storybook_nursery',
        'artist_studio',
        'sweet_slumber_party',
        'cozy_kitsch',
        'secret_sanctuary',
        'comfy_gamer',
        'casanova_cave',
        'refined_living_room',
        'business_chic',
        -- events
        'cozy_celebrations',
        'blast_from_the_past'
);

CREATE TYPE product_type AS ENUM(
        'base_game',
        'expansion_pack',
        'game_pack',
        'stuff_pack',
        'kit',
        'event'
);

CREATE TABLE products(
        id product_id PRIMARY KEY,
        name text NOT NULL,
        type product_type NOT NULL,
        release_date date NOT NULL
);

INSERT INTO products(id, type, name, release_date)
        VALUES
                -- base game
('base', 'base_game', 'The Sims 4', '09/02/2024'),
                -- expansions
('get_to_work', 'expansion_pack', 'Get To Work', '03/31/2015'),
('get_together', 'expansion_pack', 'Get Together', '12/08/2015'),
('city_living', 'expansion_pack', 'City Living', '11/1/2016'),
('cats_and_dogs', 'expansion_pack', 'Cats & Dogs', '11/10/2017'),
('seasons', 'expansion_pack', 'Seasons', '06/22/2018'),
('get_famous', 'expansion_pack', 'Get Famous', '11/16/2018'),
('island_living', 'expansion_pack', 'Island Living', '06/21/2019'),
('discover_university', 'expansion_pack', 'Discover University', '11/15/2019'),
('eco_lifestyle', 'expansion_pack', 'Eco Lifestyle', '06/05/2020'),
('snowy_escape', 'expansion_pack', 'Snowy Escape', '11/13/2020'),
('cottage_living', 'expansion_pack', 'Cottage Living', '07/22/2021'),
('high_school_years', 'expansion_pack', 'High School Years', '07/28/2022'),
('growing_together', 'expansion_pack', 'Growing Together', '03/16/2023'),
('horse_ranch', 'expansion_pack', 'Horse Ranch', '07/21/2023'),
('for_rent', 'expansion_pack', 'For Rent', '12/05/2023'),
('lovestruck', 'expansion_pack', 'Lovestruck', '07/25/2024'),
('life_and_death', 'expansion_pack', 'Life & Death', '10/31/2024'),
('businesses_and_hobbies', 'expansion_pack', 'Businesses & Hobbies', '03/06/2025'),
                -- game packs
('outdoor_retreat', 'game_pack', 'Outdoor Retreat', '01/13/2015'),
('spa_day', 'game_pack', 'Spa Day', '07/14/2015'),
('dine_out', 'game_pack', 'Dine Out', '06/07/2016'),
('vampires', 'game_pack', 'Vampires', '01/24/2017'),
('parenthood', 'game_pack', 'Parenthood', '05/30/2017'),
('jungle_adventure', 'game_pack', 'Jungle Adventure', '02/27/2018'),
('strangerville', 'game_pack', 'StrangerVille', '02/26/2019'),
('realm_of_magic', 'game_pack', 'Realm of Magic', '10/09/2019'),
('star_wars_journey_to_batuu', 'game_pack', 'Star Wars: Journey to Batuu', '09/08/2020'),
('dream_home_decorator', 'game_pack', 'Dream Home Decorator', '06/01/2021'),
('my_wedding_stories', 'game_pack', 'My Wedding Stories', '02/23/2022'),
('werewolves', 'game_pack', 'Werewolves', '06/16/2022'),
                -- stuff packs
('luxury_party', 'stuff_pack', 'Luxury Party', '05/19/2015'),
('perfect_patio', 'stuff_pack', 'Perfect Patio', '06/16/2015'),
('cool_kitchen', 'stuff_pack', 'Cool Kitchen', '08/11/2015'),
('spooky', 'stuff_pack', 'Spooky', '09/29/2015'),
('movie_hangout', 'stuff_pack', 'Movie Hangout', '01/12/2016'),
('romantic_garden', 'stuff_pack', 'Romantic Garden', '02/09/2016'),
('kids_room', 'stuff_pack', 'Kids Room', '06/28/2016'),
('backyard', 'stuff_pack', 'Backyard', '07/19/2016'),
('vintage_glamour', 'stuff_pack', 'Vintage Glamour', '12/06/2016'),
('bowling_night', 'stuff_pack', 'Bowling Night', '03/29/2017'),
('fitness', 'stuff_pack', 'Fitness', '06/20/2017'),
('toddler', 'stuff_pack', 'Toddler', '08/24/2017'),
('laundry_day', 'stuff_pack', 'Laundry Day', '01/16/2018'),
('my_first_pet', 'stuff_pack', 'My First Pet', '03/13/2018'),
('moschino', 'stuff_pack', 'Moschino', '09/03/2019'),
('tiny_living', 'stuff_pack', 'Tiny Living', '01/21/2020'),
('nifty_knitting', 'stuff_pack', 'Nifty Knitting', '07/28/2020'),
('paranormal', 'stuff_pack', 'Paranormal', '01/26/2021'),
('home_chef_hustle', 'stuff_pack', 'Home Chef Hustle', '09/28/2023'),
('crystal_creations', 'stuff_pack', 'Crystal Creations', '02/29/2024'),
                -- kits
('throwback_fit', 'kit', 'Throwback Fit', '03/02/2021'),
('country_kitchen', 'kit', 'Country Kitchen', '03/02/2021'),
('bust_the_dust', 'kit', 'Bust the Dust', '03/02/2021'),
('courtyard_oasis', 'kit', 'Courtyard Oasis', '05/18/2021'),
('modern_menswear', 'kit', 'Modern Menswear', '12/02/2021'),
('carnaval_streetwear', 'kit', 'Carnaval Streetwear', '02/03/2022'),
('decor_to_the_max', 'kit', 'Decor to the Max', '03/21/2022'),
('moonlight_chic', 'kit', 'Moonlight Chic', '05/26/2022'),
('little_campers', 'kit', 'Little Campers', '05/26/2022'),
('first_fits', 'kit', 'First Fits', '09/01/2022'),
('desert_luxe', 'kit', 'Desert Luxe', '09/14/2022'),
('pastel_pop', 'kit', 'Pastel Pop', '11/10/2022'),
('everyday_clutter', 'kit', 'Everyday Clutter', '11/10/2022'),
('simtimates_collection', 'kit', 'Simtimates Collection', '01/19/2023'),
('bathroom_clutter', 'kit', 'Bathroom Clutter', '01/19/2023'),
('greenhouse_haven', 'kit', 'Greenhouse Haven', '04/20/2023'),
('basement_treasures', 'kit', 'Basement Treasures', '04/20/2023'),
('grunge_revival', 'kit', 'Grunge Revival', '06/01/2023'),
('book_nook', 'kit', 'Book Nook', '06/01/2023'),
('poolside_splash', 'kit', 'Poolside Splash', '09/07/2023'),
('modern_luxe', 'kit', 'Modern Luxe', '09/07/2023'),
('goth_galore', 'kit', 'Goth Galore', '01/18/2024'),
('castle_estate', 'kit', 'Castle Estate', '01/18/2024'),
('urban_homage', 'kit', 'Urban Homage', '04/18/2024'),
('party_essentials', 'kit', 'Party ESsentials', '04/18/2024'),
('riviera_retreat', 'kit', 'Riviera Retreat', '05/30/2024'),
('cozy_bistro', 'kit', 'Cozy Bistro', '05/30/2024'),
('storybook_nursery', 'kit', 'Storybook Nursery', '09/19/2024'),
('artist_studio', 'kit', 'Artist Studio', '09/19/2024'),
('sweet_slumber_party', 'kit', 'Sweet Slumber Party', '11/14/2024'),
('cozy_kitsch', 'kit', 'Cozy Kitsch', '11/14/2024'),
('secret_sanctuary', 'kit', 'Secret Sanctuary', '01/16/2025'),
('comfy_gamer', 'kit', 'Comfy Gamer', '01/16/2025'),
('casanova_cave', 'kit', 'Casanova Cave', '01/16/2025'),
('refined_living_room', 'kit', 'Refined Living Room', '01/30/2025'),
('business_chic', 'kit', 'Business Chic', '01/30/2025'),
                -- events
('cozy_celebrations', 'event', 'Cozy Celebrations', '12/03/2024'),
('blast_from_the_past', 'event', 'Blast from the Past', '02/24/2025');

CREATE TYPE age_id AS ENUM(
        'newborn',
        'infant',
        'toddler',
        'child',
        'teen',
        'young_adult',
        'adult',
        'elder'
);

CREATE TABLE ages(
        id age_id PRIMARY KEY,
        name text NOT NULL
);

INSERT INTO ages(id, name)
        VALUES
                -- ages
('newborn', 'Newborn'),
('infant', 'Infant'),
('toddler', 'Toddler'),
('child', 'Child'),
('teen', 'Teen'),
('young_adult', 'Young Adult'),
('adult', 'Adult'),
('elder', 'Elder');

CREATE TYPE aspiration_id AS ENUM(
        -- Child
        'child_artistic_prodigy',
        'child_rambunctious_scamp',
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
        -- Familyx
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

CREATE TABLE aspirations(
        id aspiration_id PRIMARY KEY,
        name text NOT NULL,
        category text NOT NULL,
        description text NOT NULL,
        product product_id REFERENCES products(id) NOT NULL
);

INSERT INTO aspirations(id, category, product, name, description)
        VALUES
                -- Child
('child_artistic_prodigy', 'Child', 'base', 'Artistic Prodigy', 'This Sim has dreams of succeeding in the arts!'),
('child_rambunctious_scamp', 'Child', 'base', 'Rambunctious Scamp', 'This Sim wants to be playful and nimble!'),
('child_whiz_kid', 'Child', 'base', 'Whiz Kid', 'This Sim wants to be the smartest kid in school!'),
('child_slumber_party_animal', 'Child', 'growing_together', 'Slumber Party Animal', 'This Sim wants to be the life of the party - in a uniquely creative way!'),
('child_mind_and_body', 'Child', 'growing_together', 'Mind and Body', 'This Sim wants to master both their mind and body!'),
('child_playtime_captain', 'Child', 'growing_together', 'Playtime Captain', 'This Sim loves to seek out active play - with friends!'),
('child_creative_genius', 'Child', 'growing_together', 'Creative Genius', 'This Sim wants to build their creative and mental skills to inspire innovation and play!'),
                -- Teen
('teen_drama_llama', 'Teen', 'high_school_years', 'Drama LLama', 'This Sim wants all the drama all the time.'),
('teen_goal_oriented', 'Teen', 'high_school_years', 'Goal Oriented', 'This Sim wants to be the best: Grades? Check. Sports? Check. Money? Check! The road to success is being paved!'),
('teen_live_fast', 'Teen', 'high_school_years', 'Live Fast', 'This Sim aims to get the most out of live by living care-free and rules-free.'),
('teen_admired_icon', 'Teen', 'high_school_years', 'Admired Icon', 'This Sim wants to be a trend setter, popular, and influential. A true icon.'),
                -- Animal
('friend_of_the_animals', 'Animal', 'cats_and_dogs', 'Friend of the Animals', 'This Sim wants to be friends with the animals.'),
                -- Athletic
('bodybuilder', 'Athletic', 'base', 'Bodybuilder', 'This Sim wants to work out and become as strong as they can be!'),
('extreme_sports_enthusiast', 'Athletic', 'snowy_escape', 'Extreme Sports Enthusiast', 'This Sim wants to explore Mt. Komorebi''s wilderness and participate in extreme snow sports.'),
('championship_rider', 'Athletic', 'horse_ranch', 'Championship Rider', 'This Sim wants to be one of the world''s premiere Horse Riders and will prove it by participating in Horse Competitions.'),
                -- Creativity
('painter_extraordinaire', 'Creativity', 'base', 'Painter Extraordinaire', 'This Sim wants his/her life to be all about art and painting!'),
('musical_genius', 'Creativity', 'base', 'Musical Genius', 'This Sim wants to be an expert musician and songwriter!'),
('bestselling_author', 'Creativity', 'base', 'Bestselling Author', 'This Sim wants to write books and become a famous author!'),
('master_actor_actress', 'Creativity', 'get_famous', 'Master Actor/Master Actress', 'This Sim wants to hone their craft and become an acclaimed actor/actress!'),
('master_maker', 'Creativity', 'eco_lifestyle', 'Master Maker', 'This Sim wants to become an expert at Fabrication!'),
('lord_lady_of_the_knits', 'Creativity', 'nifty_knitting', 'Lord/Lady of the Knits', 'This Sim has yarn running through his/her veins and will stop at nothing on his/her quest to craft the perfect knittable!'),
                -- Deviance
('public_enemy', 'Deviance', 'base', 'Public Enemy', 'This Sim wants to make enemies and be a famous criminal!'),
('chief_of_mischief', 'Deviance', 'base', 'Chief of Mischief', 'This Sim is all about pranks and mayhem!'),
('villainous_valentine', 'Deviance', 'base', 'Villainous Valentine', 'This Sim wants to destroy the love lives of all Sims, including their own!'),
('seeker_of_secrets', 'Deviance', 'for_rent', 'Seeker of Secrets', 'This Sim loves the thrill of discovering juicy Secrets about other Sims. What they do with that information has yet to be decided...'),
('sticky_fingers', 'Deviance', 'blast_from_the_past', 'Sticky Fingers', 'This Sim wants to become a master procurer and redistributor of goods and wealth to their own pocket.'),
                -- Family
                ('successful_lineage', 'Family', 'base', 'Successful Lineage', 'This Sim wants to have a family that succeeds in life!'),
('big_happy_family', 'Family', 'base', 'Big Happy Family', 'This Sim wants to build a large, loving household!'),
('vampire_family', 'Family', 'vampires', 'Vampire Family', 'This Sim wants to have a family of Vampires!'),
('super_parent', 'Family', 'parenthood', 'Super Parent', 'This Sim wants to be the best parent ever!'),
                -- Food
('master_chef', 'Food', 'base', 'Master Chef', 'This Sim wants to master the Culinary Arts!'),
('master_mixologist', 'Food', 'base', 'Master Mixologist', 'This Sim wants to know everything there is to know about Mixology!'),
('expert_nectar_maker', 'Food', 'horse_ranch', 'Expert Nectar Maker', 'This Sim wants to master the art of Nectar Making, honing their abilities to consistently craft only the best Nectars. They also want to make an absurd amount of Simoleons doing it.'),
('appliance_whiz', 'Food', 'home_chef_hustle', 'Appliance Wiz', 'This Sim knows their way around the small kitchen appliances!'),
('grilled_cheese', 'Food', 'base', 'Grilled Cheese', 'TBD'),
                -- Fortune
('fabulously_wealthy', 'Fortune', 'base', 'Fabulously Wealthy', 'This Sim wants to get rich and have a successful career!'),
('mansion_baron', 'Fortune', 'base', 'Mansion Baron', 'This Sim is all about owning the biggest, fanciest home!'),
('market_magnate', 'Fortune', 'home_chef_hustle', 'Market Magnate', 'This sim wants to operate the most profitable Food Stand!'),
('five_star_property_owner', 'Fortune', 'for_rent', 'Five-Star Property Owner', 'This sim wants to be the best Property Owner the world has ever seen!'),
                -- Knowledge
('renaissance_sim', 'Knowledge', 'base', 'Renaissance Sim', 'This sim wants to be good at many things at once!'),
('nerd_brain', 'Knowledge', 'base', 'Nerd Brain', 'This sim wants to be both book smart and handy!'),
('computer_whiz', 'Knowledge', 'base', 'Computer Whiz', 'This sim wants to know everything about computers, from playing games to Careers!'),
('master_vampire', 'Knowledge', 'vampires', 'Master Vampire', 'This sim wants to become a wise and power Vampire!'),
('archaeology_scholar', 'Knowledge', 'jungle_adventure', 'Archaeology Scholar', 'This sim wants to understand Archaeology. Sims who select this Aspiration will complete a series of actions related to the Archaeology Skill.'),
('spellcraft_and_sorcery', 'Knowledge', 'realm_of_magic', 'Spellcraft & Sorcery', 'This Sim craves a deep knowledge of the arcane magical arts.'),
('academic', 'Knowledge', 'discover_university', 'Academic', 'This sim wants to attend university and get a job, but most importantly – learn!'),
('ghost_historian', 'Knowledge', 'life_and_death', 'Ghost Historian', 'This sim wants to learn everything about ghosts and use the findings to write spooky horror novels!'),
('master_mentor', 'Knowledge', 'businesses_and_hobbies', 'Master Mentor', 'This sim wants to learn from talented mentors, then pass that knowledge on to others.'),
                -- Location
('city_native', 'Location', 'city_living', 'City Native', 'This sim is all about the city life.'),
('strangerville_mystery', 'Location', 'strangerville', 'StrangerVille Mystery', 'StrangerVille IS holding SOME deep dark secret, AND this Sim wants TO uncover why ALL the townsfolk are acting a bit strange.'),
('beach_life', 'Location', 'island_living', 'Beach Life', 'This sim wants to take it slow and enjoy beach life.'),
('mt_komorebi_sightsser', 'Location', 'snowy_escape', 'Mt. Komorebi Sightseer', 'This sim wants to explore Mt. Komorebi''s culture and experience everything it has to offer.'),
('perfectly_pristine', 'Location', 'bust_the_dust', 'Perfectly Pristine', 'This sim likes their home to be presentable and clean all the time. Taking pride in their pristine homes, these Sims shoot for perfection and thrive when they have a spotless house to show off to guests.'),
('fabulously_filthy', 'Location', 'bust_the_dust', 'Fabulously Filthy', 'This sim revels in filthy, messy homes and avoids cleaning at all costs. Procrastinate, dodge chores, lower your standards, and find creative ways to thrive in the filthiest environments!'),
('fount_of_tomarani_knowledge', 'Location', 'for_rent', 'Fount of Tomarani Knowledge', 'This sim wants to immerse themselves in everything Tomarang has to offer!'),
                -- Love
('serial_romantic', 'Love', 'base', 'Serial Romantic', 'This Sim wants to play the field and go on all sorts of dates with people!'),
('soulmate', 'Love', 'base', 'Soulmate', 'This Sim wants to find and live a rewarding life with "The One"!'),
('romantic_explorer', 'Love', 'lovestruck', 'Romantic Explorer', 'This sim wants to explore all that romance has to offer.'),
('paragon_partner', 'Love', 'lovestruck', 'Paragon Partner', 'This sim wants to have successful relationships with two or more Sims.'),
                -- Nature
('freelance_botanist', 'Nature', 'base', 'Freelance Botanist', 'This sim wants to grow plants and become an expert Gardener!'),
('the_curator', 'Nature', 'base', 'The Curator', 'This sim wants to collect everything this world has to offer!'),
('angling_ace', 'Nature', 'base', 'Angling Ace', 'This sim wants to know everything about fishing!'),
('outdoor_enthusiast', 'Nature', 'outdoor_retreat', 'Outdoor Enthusiast', 'Outdoor Enthusiasts want to experience everything nature has to offer!'),
('jungle_explorer', 'Nature', 'jungle_adventure', 'Jungle Explorer', 'This sim wants to explore the jungle! Sims who select this Aspiration will complete a series of actions related to the exploration.'),
('purveyor_of_potions', 'Nature', 'realm_of_magic', 'Purveyor of Potions', 'This sim wants to learn every potion''s recipe and craft each one!'),
('eco_innovator', 'Nature', 'eco_lifestyle', 'Eco Innovator', 'This sim wants to build a better, greener community.'),
('country_caretaker', 'Nature', 'cottage_living', 'Country Caretaker', 'Country Caretakers want to tend the countryside and befriend all animals and critters!'),
('crystal_crafter', 'Nature', 'crystal_creations', 'Crystal Crafter', 'This sim wants to cut gemstones, craft jewelry, and harness the power of the crystals!'),
                -- Popularity
('joke_star', 'Popularity', 'base', 'Joke Star', 'This sim wants to tell jokes and become an famous comedian!'),
('party_animal', 'Popularity', 'base', 'Party Animal', 'This sim wants to throw and attend amazing parties!'),
('friend_of_the_world', 'Popularity', 'base', 'Friend of the World', 'This sim wants to make and keep as many friends as they can!'),
('neighborhood_confidant', 'Popularity', 'base', 'Neighborhood Confidante', 'This sim wants to provide all manner of advice, to be a positive influence in the lives of their neighbors.'),
('leader_of_the_pack', 'Popularity', 'get_together', 'Leader of the Pack', 'This sim wants to be the leader of the best Club in Town!'),
('good_vampire', 'Popularity', 'vampires', 'Good Vampire', 'This sim wants to tame his/her thirst and remain as human as possible!'),
('world_famous_celebrity', 'Popularity', 'get_famous', 'World-Famous Celebrity', 'This sim wants to become illustriously famous.'),
('discerning_dweller', 'Popularity', 'for_rent', 'Discerning Dweller', 'This sim aspires to be the perfect Tenant and neighbor in a Residential Rental!'),
('esteemed_entrepreneur', 'Popularity', 'businesses_and_hobbies', 'Esteemed Entrepreneur', 'This sim wants to run a small business full of happy customers, either through business practices rooted in idealistic dreams or tricky hustles based on pragmatic schemes'),
                -- Star Wars
('hope_vs_order', 'Star Wars', 'star_wars_journey_to_batuu', 'Hope VS Order', 'On the world of Batuu there is a growing conflict. This Sim is out to explore Black Spire Outpost and understand whether they should stand with the Resistance of the First Order.'),
('paragon_of_hope', 'Star Wars', 'star_wars_journey_to_batuu', 'Paragon of Hope', 'This sim looks to be the spark of hope that disrupts the First Order''s operations on Batuu and aid the Resistance cause.'),
('enforcer_of_order', 'Star Wars', 'star_wars_journey_to_batuu', 'Enforcer of Order', 'This sim is out to prove their loyalty to the First Order by stamping out the Resistance presence on Batuu.'),
('galactic_privateer', 'Star Wars', 'star_wars_journey_to_batuu', 'Galactic Privateer', 'This sim isn''t about choosing sides, they''re happy just mingling among the smugglers, and bounty hunters on the fringe planet of Batuu. Earning a few extra credits along the way is just a bonus, no matter how they get them.'),
                -- Wellness
('inner_peace', 'Wellness', 'spa_day', 'Inner Peace', 'This sim is on quest to achieve Inner Peace. Although true harmony is sometimes ephemeral, what''s important IS developing tools TO help mitigate negative emotions.'),
('self_care_specialist', 'Wellness', 'spa_day', 'Self-Care Specialist', 'This sim wants to make it big with monetizing Wellness activities like offering Manicures or Tending the Massage Table at Spa.'),
('zen_guru', 'Wellness', 'spa_day', 'Zen Guru', 'This sim wants to share their mastery of Wellness with the world, and train a successor to pass on their knowledge.'),
                -- Werewolf
('werewolf_initiate', 'Werewolf', 'werewolves', 'Werewolf Initiate', 'This Sim wants to unleash his/her inner beast and become a werewolf!'),
('lone_wolf', 'Werewolf', 'werewolves', 'Lone Wolf', 'This Sim wants to become the strongest and most feared werewolf, all on his/her own!'),
('emissary_of_the_collective', 'Werewolf', 'werewolves', 'Emissary of the Collective', 'This sim wants to join The Moonwood Collective and become a friendly ambassador to all!'),
('wildfang_renegade', 'Werewolf', 'werewolves', 'Wildfang Renegade', 'This Sim wants to join the Wildfangs and unapologetically take on the world as a Werewolf!'),
('cure_seeker', 'Werewolf', 'werewolves', 'Cure Seeker', 'This Sim seeks a cure for lycanthropy to live his/her life as a non-werewolf Sim.');

CREATE TYPE trait_id AS ENUM(
        -- emotional
        'ambitious',
        'cheerful',
        'childish',
        'clumsy',
        'creative',
        'erratic',
        'genius',
        'gloomy',
        'goofball',
        'high_maintenance',
        'hot_headed',
        'lovebug',
        'paranoid',
        'practice_makes_perfect',
        'romantic',
        'romantically_reserved',
        'self_assured',
        'squeamish',
        'unflirty',
        'wise',
        -- hobby
        'art_lover',
        'bookworm',
        'dance_machine',
        'foodie',
        'geek',
        'loves_outdoors',
        'maker',
        'music_lover',
        'recycle_disciple',
        -- lifestyle
        'active',
        'adventurous',
        'chased_by_death',
        'child_of_the_islands',
        'child_of_the_ocean',
        'child_of_the_village',
        'freegan',
        'glutton',
        'green_fiend',
        'kleptomaniac',
        'lactose_intolerant',
        'lazy',
        'macabre',
        'materialistic',
        'neat',
        'overachiever',
        'perfectionist',
        'rancher',
        'skeptical',
        'slob',
        'vegetarian',
        -- social
        'animal_enthusiast',
        'bro',
        'cat_lover',
        'cringe',
        'dog_lover',
        'evil',
        'family_oriented',
        'generous',
        'good',
        'grouch',
        'hates_children',
        'horse_lover',
        'idealist',
        'insider',
        'jealous',
        'loner',
        'loyal',
        'mean',
        'noncommital',
        'nosy',
        'outgoing',
        'party_animal',
        'proper',
        'self_absorbed',
        'shady',
        'snob',
        'socially_awkward',
        -- toddler
        'angelic',
        'charmer',
        'clingy',
        'fussy',
        'independent',
        'inquisitive',
        'silly',
        'wild',
        -- infant
        'cautious',
        'sensitive',
        'calm',
        'intense',
        'wiggly',
        'sunny'
        --
);

CREATE TABLE traits(
        id trait_id PRIMARY KEY,
        name text NOT NULL,
        description text NOT NULL,
        restricted_to_age age_id REFERENCES ages(id),
        product product_id REFERENCES products(id) NOT NULL
);

INSERT INTO traits(id, name, product, restricted_to_age, description)
        VALUES
                -- emotional
('ambitious', 'Ambitious', 'base', NULL, 'These Sims gain powerful Moodlets from career success, gain negative Moodlets from career failure, and may become Tense if not promoted.'),
('cheerful', 'Cheerful', 'base', NULL, 'These Sims tend to be Happier than other Sims.'),
('childish', 'Childish', 'base', NULL, 'These Sims gain powerful Moodlets from watching the Kids Network, become Playful when playing with Children, and become Happy when playing with Children''s toys.'),
('clumsy', 'Clumsy', 'base', NULL, 'These Sims tend to fail more often at physical activities and tend to laugh at failure instead of becoming upset.'),
('creative', 'Creative', 'base', NULL, 'These Sims tend to be Inspired, can Share Creative Ideas with other Sims, and may become upset if they''re not creative for a period of time.'),
('erratic', 'Erratic', 'base', NULL, 'These Sims can Talk to themselves and have unpredictable Emotions.'),
('genius', 'Genius', 'base', NULL, 'These Sims tend to be Focused, can Share Ideas with other Sims, and may become upset if they haven''t improved their Mental Skills for some time.'),
('gloomy', 'Gloomy', 'base', NULL, 'These Sims tend to be Sad, can Share Melancholy Thoughts to other Sims, and while sad, gain a boost to their Creative Skill.'),
('goofball', 'Goofball', 'base', NULL, 'These Sims tend to be Playful.'),
('high_maintenance', 'High Maintenance', 'spa_day', NULL, 'These Sims require extra work to keep in good condition. Their problems sometimes appear trivial, and may even appear out of the blue. These struggles can be remedied through mindful habits, which puts them in a state of catharsis.'),
('hot_headed', 'Hot-Headed', 'base', NULL, 'These Sims tend to be Angry, can Rile up other Sims, and become Angry when targeted with Mischief.'),
('lovebug', 'Lovebug', 'lovestruck', NULL, 'Sims with this trait are constantly swept up in the whirlwind of romance. They fall in love easily, often wearing their hearts on their sleeves.'),
('paranoid', 'Paranoid', 'strangerville', NULL, 'Paranoid Sims feel that danger is around every corner, and that people are always talking about them. Paranoid Sims feel a sense of security while hanging out in basements.'),
('practice_makes_perfect', 'Practice Makes Perfect', 'base', NULL, 'Sims with this trait learn skills faster, even if they are a bit slower at first.'),
('romantic', 'Romantic', 'base', NULL, 'These Sims tend to be Flirty and may become Sad if they don''t have any Romantic social interactions for a period of time.'),
('romantically_reserved', 'Romantically Reserved', 'lovestruck', NULL, 'These Sims often tread carefully in the realm of love, preferring to take their time and build solid emotional connections before jumping headfirst into romance.'),
('self_assured', 'Self-Assured', 'base', NULL, 'These Sims tend to be Confident.'),
('squeamish', 'Squeamish', 'outdoor_retreat', NULL, 'Squeamish Sims are nauseated by the sight of creepy crawlies, vomiting, violence and death. These Sims become Uncomfortable near anything dirty.'),
('unflirty', 'Unflirty', 'city_living', NULL, 'These Sims get Tense around Flirty Sims and seldom get Flirty themselves. It''s difficult for them to be Romantic in public.'),
('wise', 'Wise', 'businesses_and_hobbies', 'elder', 'A Sim who''s experienced enough of life to know what really matters. These Sims enjoy reminiscing and sharing life''s wisdom, making them excellent Mentors for those willing to listen. Their years of experience allow them to naturally learn new Skills with ease, and their emotional intelligence reduces their angry and uncomfortable thoughts.'),
                -- hobby
('art_lover', 'Art Lover', 'base', NULL, 'These Sims gain powerful Moodlets from Viewing works of art and can Admire Art and Discuss Art in unique ways.'),
('bookworm', 'Bookworm', 'base', NULL, 'These Sims gain powerful Moodlets from reading Books and can Analyze Books and Discuss Books in unique ways.'),
('dance_machine', 'Dance Machine', 'get_together', NULL, 'These Sims can''t wait to get down, boogie, and party all night! When at venues like Bars, Nightclubs, and Lounges, these Sims can get a burst of energy with the Party Time interaction.'),
('foodie', 'Foodie', 'base', NULL, 'These Sims become Happy and have Fun when eating good food, become Uncomfortable when eating bad food, and can Watch Cooking Shows for ideas.'),
('geek', 'Geek', 'base', NULL, 'These Sims become Happy when Reading Sci-Fi or Playing Video Games, may become Tense if they haven''t played much, are better at finding Collectibles, and can Discuss Geek Things with other Geek Sims.'),
('loves_outdoors', 'Loves Outdoors', 'base', NULL, 'These Sims can Enthuse about Nature to other Sims and become Happy when Outdoors.'),
('maker', 'Maker', 'eco_lifestyle', NULL, 'These Sims become happy when making things. They become sad when it''s been too long since completing a project on a Fabricator, Candlemaking Station, Juice Fizzer, or Woodworking Table. They do not receive negative effects from crafting or repair failures.'),
('music_lover', 'Music Lover', 'base', NULL, 'These Sims gain powerful Moodlets and boost their Fun Need when Listening to Music and become Happy when playing instruments.'),
('recycle_disciple', 'Recycle Disciple', 'eco_lifestyle', NULL, 'These Sims are rabid recyclers that benefit from recycling and rummaging for bits and pieces, but should they go too long without indulging in their hobby...'),
                -- lifestyle
('active', 'Active', 'base', NULL, 'These Sims tend to be Energized, can Pump Up other Sims, and may become upset if they don''t exercise for a period of time.'),
('adventurous', 'Adventurous', 'snowy_escape', NULL, 'These Sims seek out new and unique experiences.'),
('chased_by_death', 'Chased By Death', 'life_and_death', NULL, 'Chased by Death sims know that death follows their every move. While risky and dangerous behaviors may have deadly consequences, frequent near-death experiences give these Sims a desire to live each day to the fullest and progress along their soul''s journey faster. Keenly aware of theirs own mortality , these Sims feel best when they are achieving something meaningful with their limited time left.'),
('child_of_the_islands', 'Child of the Islands', 'island_living', NULL, 'These Sims experience a spiritual connection to islands of Sulani. Honor the islands by partaking in their culture, summon powerful elementals and reap the rewards of their blessings—or the consequences of their disfavor.'),
('child_of_the_ocean', 'Child of the Ocean', 'island_living', NULL, 'Answer the call of the ocean! Sims with this trait will prefer water related activities and feel closer to denizens of the sea.'),
('child_of_the_village', 'Child of the Village', 'for_rent', NULL, 'These Sims love feeling anchored to their community and Tomarani culture. Keeping in touch with loved ones and engaging in activities that remind them of home is important for being Happy.'),
('freegan', 'Freegan', 'eco_lifestyle', NULL, 'These Sims reject consumerism and prefer to reduce wasteful spending by any means. They enjoy finding re-used or thrown away goods and foods. In fact, they have the best luck at finding the highest-quality treasures in Dumpsters! They may become tense or uncomfortable if they spend too much time earning or spending Simoleons.'),
('glutton', 'Glutton', 'base', NULL, 'These Sims have a greater negative reaction to Hunger, always enjoy eating, no matter the quality of the food, and will eat Spoiled Food.'),
('green_fiend', 'Green Fiend', 'eco_lifestyle', NULL, 'These Sims are happiest when living on a green street and will continuously work towards making their environment more eco-friendly.'),
('kleptomaniac', 'Kleptomaniac', 'base', NULL, 'These Sims don''t mind "borrowing" things from others with a simple swipe, but will get Tense when they have not swiped anything in a while.'),
('lactose_intolerant', 'Lactose Intolerant', 'cottage_living', NULL, 'These Sims will become sick if they eat dairy, but will feel great if they have avoided it for a while.'),
('lazy', 'Lazy', 'base', NULL, 'These Sims gain powerful Moodlets from Watching TV or Napping as well as from Comfortable furniture, become Fatigued more quickly from exercise, and grow Tense when performing household chores.'),
('macabre', 'Macabre', 'life_and_death', NULL, 'Embrace your inner darkness - and your occasional intrusions of light. Macabre Sims are all about being their best, unique Sim self while still reveling in all that life (and the afterlife) has to offer.'),
('materialistic', 'Materialistic', 'base', NULL, 'These Sims can Admire and Brag about Possessions and become Sad when they haven''t purchased a new item for a period of time.'),
('neat', 'Neat', 'base', NULL, 'These Sims become Happy and have Fun when performing household chores, can have a Cleaning Frenzy, and become really Uncomfortable in dirty surroundings.'),
('overachiever', 'Overachiever', 'high_school_years', NULL, 'These Sims tend to raise their skills faster and are happy when they finish work tasks, but are a little harder to get along with as friends.'),
('perfectionist', 'Perfectionist', 'base', NULL, 'These Sims take longer to craft items but tend to make them higher quality, gain powerful Moodlets after crafting a high quality item, and gain negative Moodlets after crafting a low quality item.'),
('rancher', 'Rancher', 'horse_ranch', NULL, 'These Sims excel at ranch life and take pride in their work. They enjoy ranch chores and caring for their Livestock.'),
('skeptical', 'Skeptical', 'life_and_death', NULL, 'Not entirely trusting of the majority of this you see of hear. Skeptical Sims like the challenge the universe to provide concrete proof that something is indeed as it might appear'),
('slob', 'Slob', 'base', NULL, 'These Sims are not affected by dirty surroundings, make household items dirtier faster, and can Rummage for Food in garbage.'),
('vegetarian', 'Vegetarian', 'base', NULL, 'These Sims will actively avoid eating foods that contain meat products and can become sick if they eat such foods.'),
                -- social
('animal_enthusiast', 'Animal Enthusiast', 'cottage_living', NULL, 'These Sims are obsessed with animals, and will seek their company often. They will have an easier time caring for animals and getting closer to them.'),
('bro', 'Bro', 'base', NULL, 'These Sims can Bro Hug other Bros, gain Confidence around other Bros, and become Energized from Watching Sports.'),
('cat_lover', 'Cat Lover', 'cats_and_dogs', NULL, 'These Sims tend to make cats their companions, preferring the company of cats to other Sims.'),
('cringe', 'Cringe', 'for_rent', NULL, 'Sims who are obnoxiously oblivious and oftentimes met with polarizing reactions. Cringe Sims can be socially unaware of their surroundings at times, but have an adorable enthusiasm for life.'),
('dog_lover', 'Dog Lover', 'cats_and_dogs', NULL, 'These Sims love to be near dogs. They will gain relationships faster with dogs and socialize with dogs more than the average Sim.'),
('evil', 'Evil', 'base', NULL, 'These Sims become Happy around Sims with negative Moodlets, can Laugh Maniacally and Discuss Evil Plans, and become Angry when interacting with Good Sims.'),
('family_oriented', 'Family-oriented', 'base', NULL, 'These Sims become Happy around family members, become Sad if they don''t interact with family for a period of time, and can Boast about Family.'),
('generous', 'Generous', 'for_rent', NULL, 'Caring, empathetic, and patient. These Sims are happiest when offering their time and money to help others. Everyone loves Generous Sims, but they can be a little too brazen with their donations.'),
('good', 'Good', 'base', NULL, 'These Sims become Happy around Sims with positive Moodlets, can Donate to Charity, become Sad with interacting with Evil Sims, and can Discuss World Peace.'),
('grouch', 'Grouch', 'cozy_celebrations', NULL, 'These Sims raise their Mischief skill faster by playing pranks and bothering others with their surprises.'),
('hates_children', 'Hates Children', 'base', NULL, 'These Sims become Angry around Children, become Tense after Try for a Baby, and can be Mean to Children.'),
('horse_lover', 'Horse Lover', 'horse_ranch', NULL, 'These Sims share a strong bond with Horses. They have an easier time socializing with and caring for Horses than other Sims.'),
('idealist', 'Idealist', 'businesses_and_hobbies', NULL, 'These Sims hold high moral standards and strive for a better world guided by their values and principles. They are committed to doing what they believe is right, even when it''s challenging.'),
('insider', 'Insider', 'get_together', NULL, 'These Sims love being in Clubs, and tend to be happiest when surrounded by their friends.'),
('jealous', 'Jealous', 'base', NULL, 'These Sims get Jealous more easily than other Sims. They gain a boost of Confidence from being around their significant other, but get Tense if they haven''t seen them recently.'),
('loner', 'Loner', 'base', NULL, 'These Sims become Happy when alone, do not receive negative Moodlets when their Social Need is low, become Tense around strangers, and become Embarrassed more often by social rejection.'),
('loyal', 'Loyal', 'base', NULL, 'Loyal sims [sic] value their relationships and fully commit to them. whether they are friendship, romance or even work! They avoid lying and cheating because their loved ones'' trust is very important to them.'),
('mean', 'Mean', 'base', NULL, 'These Sims become Happy when being Mean or Mischievous to other Sims and become Confident after winning a fight.'),
('noncommital', 'Noncommital', 'base', NULL, 'These Sims become Tense after a while in the same job or relationship, become Happy when they Quit a Job or Break Off a relationship, take longer to Propose, and can Discuss their Fear of Commitment.'),
('nosy', 'Nosy', 'for_rent', NULL, 'Sims who thrive on gossip, snooping, and spying. They have incredibly poor boundaries and don''t quite understand what personal space is, but they will discover secrets by any means necessary.'),
('outgoing', 'Outgoing', 'base', NULL, 'These Sims gain powerful Moodlets from Friendly socialization, have their Social need decay quickly, and gain more negative Moodlets when their Social need is low.'),
('party_animal', 'Party Animal', 'high_school_years', NULL, 'These Sims tend to enjoy parties and letting every other Sim know by hyping up a crowd and performing party tricks.'),
('proper', 'Proper', 'snowy_escape', NULL, 'These Sims tend to disapprove of other Sims'' improper behavior such as Mean or Mischievous socials, but find themselves happier in Formal Outfits and have a much easier time with Friendly and Romantic socials.'),
('self_absorbed', 'Self-Absorbed', 'get_famous', NULL, 'These Sims are all about themselves! They can Fish for Compliments, are more excited when receiving a present, and may become tense when they haven’t gotten enough attention. The celebrity spotlight is something they generally relish. After all, everyone else should love them as much as they do themselves, right?'),
('shady', 'Shady', 'businesses_and_hobbies', NULL, 'These Sims excel at exploiting situations and bending rules for personal gain, often without regard for conventional ethics or fairness. They thrive in mischievous activities and can influence others to adopt their way of living.'),
('snob', 'Snob', 'base', NULL, 'These Sims can Critique Work on low quality items, are bored by "low brow" television, and gain Confidence around other Snob Sims.'),
('socially_awkward', 'Socially Awkward', 'high_school_years', NULL, ''),
                -- toddler
('angelic', 'Angelic', 'base', 'toddler', 'Idyllic, easygoing Toddlers. They are never defiant and they don''t throw a tantrum. They can easily talk to strangers.'),
('charmer', 'Charmer', 'base', 'toddler', 'These Toddlers love to socialize. They earn Communication skill faster, and don''t suffer Stranger Danger from strangers. They can Share the Love with other Sims.'),
('clingy', 'Clingy', 'base', 'toddler', 'These shy Toddlers avoid Sims outside the household and get sad if left behind. They gain extra skill when taught. And they recover faster from bad moods when Comforted.'),
('fussy', 'Fussy', 'base', 'toddler', 'Tiny trouble-makers who love to Cry, cause trouble, and Throw Fits. But being noticed makes them Happy and helps them overcome negative Moodlets.'),
('independent', 'Independent', 'base', 'toddler', 'These Toddlers love their freedom, and don''t like to take orders from caregivers. They gain extra skill when they are left alone, and need less Attention than other Toddlers.'),
('inquisitive', 'Inquisitive', 'base', 'toddler', 'Curious explorers. These Toddlers gain Thinking skill slightly faster. They are happiest when learning something, and sad if they haven''t learned anything lately.'),
('silly', 'Silly', 'base', 'toddler', 'Goofy and curious. These Toddlers love to tell jokes and get Playful. They earn Imagination skill slightly faster.'),
('wild', 'Wild', 'base', 'toddler', 'Spirited and full of Energy. These Toddlers love to explore and get Energized. They earn Movement skill slightly faster. They get sad if they haven''t been outside in a while.'),
                -- infant
('cautious', 'Cautious', 'base', 'infant', 'These Sims appreciate the familiar but are slow to warm up to new experiences, locations, and Sims.'),
('sensitive', 'Sensitive', 'base', 'infant', 'These Sims are prone to diaper rash, are often picky with food, and can more easily become overstimulated by too much play and social interaction; however, they also rest more peacefully through the night when soothed.'),
('calm', 'Calm', 'base', 'infant', 'These Sims like to watch the world, are less likely to cry or become angry, and don''t grow tired of activities as easily as other infants; however, they are less likely to explore the world on their own.'),
('intense', 'Intense', 'base', 'infant', 'These Sims have big emotions and are easily entertained, but they are also more difficult to calm when in a bad mood.'),
('wiggly', 'Wiggly', 'base', 'infant', 'These Sims are always on the go and want to play and move about; however they often struggle to fall asleep or pay attention for extended periods of time.'),
('sunny', 'Sunny', 'base', 'infant', 'These Sims are bursting with smiles and giggles and enjoy engaging with other Sims, but they do require more social attention.')
                --
;

CREATE TYPE life_state_id AS ENUM(
        'normal',
        'alien',
        'ghost',
        'mermaid',
        'servo',
        'spellcaster',
        'vampire',
        'werewolf'
);

CREATE TABLE life_states(
        id life_state_id PRIMARY KEY,
        name text NOT NULL
);

INSERT INTO life_states(id, name)
        VALUES
                -- life_states
('normal', 'Sim'),
('alien', 'Alien'),
('ghost', 'Ghost'),
('mermaid', 'Mermaid'),
('servo', 'Servo'),
('spellcaster', 'Spellcaster'),
('vampire', 'Vampire'),
('werewolf', 'Werewolf')
                --
;

CREATE TYPE career_branch_id AS ENUM(
        -- career branches
        'astronaut_space_ranger',
        'astronaut_interstellar_smuggler',
        'athlete_professional_athlete',
        'athlete_bodybuilder',
        'business_management',
        'business_investor',
        'criminal_boss',
        'criminal_oracle',
        'culinary_chef',
        'culinary_mixologist',
        'entertainer_musician',
        'entertainer_comedian',
        'freelancer_digital_artist',
        'freelancer_programmer',
        'freelancer_writer',
        'freelancer_fashion_photographer',
        'freelancer_crafter',
        'Freelancer',
        'freelancer_paranormal_investigator',
        'painter_master_of_the_real',
        'painter_master_of_the_arts',
        'secret_agent_diamond_agent',
        'secret_agent_villain',
        'self_employed',
        'style_influencer_trendsetter',
        'style_influencer_stylist',
        'tech_guru_esport_gamer',
        'tech_guru_start_up_entrepreneur',
        'writer_author',
        'writer_journalist',
        'detective',
        'doctor',
        'scientist',
        'critic_arts_critic',
        'critic_food_critic',
        'politician_politician',
        'politician_charity_organizer',
        'social_media_internet_personality',
        'social_media_public_relations',
        'gardener_botanist',
        'gardener_floral_designer',
        'actor',
        'military_covert_operator',
        'military_officer',
        'conservationist_environmental_manager',
        'conservationist_marine_biologist',
        'education_administrator',
        'education_professor',
        'engineer_computer_engineer',
        'engineer_mechanical_engineer',
        'law_judge',
        'law_private_attourney',
        'civil_designer_civic_planner',
        'civil_designer_green_technician',
        'salaryperson_expert',
        'salaryperson_supervisor',
        'interior_decorator',
        'romance_consultant_matchmaker',
        'romance_consultant_relationship_counselor',
        'reaper',
        'undertaker_funeral_director',
        'undertaker_mortician'
        --
);

CREATE TABLE career_branches(
        id career_branch_id PRIMARY KEY,
        career_name text NOT NULL,
        branch_name text,
        product product_id REFERENCES products(id) NOT NULL
);

INSERT INTO career_branches(id, career_name, branch_name, product)
        VALUES
                -- career branches
('astronaut_space_ranger', 'Astronaut', 'Space Ranger', 'base'),
('astronaut_interstellar_smuggler', 'Astronaut', 'Interstellar Smuggler', 'base'),
('athlete_professional_athlete', 'Athlete', 'Professional Athlete', 'base'),
('athlete_bodybuilder', 'Athlete', 'Bodybuilder', 'base'),
('business_management', 'Business', 'Management', 'base'),
('business_investor', 'Business', 'Investor', 'base'),
('criminal_boss', 'Criminal', 'Boss', 'base'),
('criminal_oracle', 'Criminal', 'Oracle', 'base'),
('culinary_chef', 'Culinary', 'Chef', 'base'),
('culinary_mixologist', 'Culinary', 'Mixologist', 'base'),
('entertainer_musician', 'Entertainer', 'Musician', 'base'),
('entertainer_comedian', 'Entertainer', 'Comedian', 'base'),
('freelancer_digital_artist', 'Freelancer', 'Digital Artist', 'base'),
('freelancer_programmer', 'Freelancer', 'Programmer', 'base'),
('freelancer_writer', 'Freelancer', 'Writer', 'base'),
('freelancer_fashion_photographer', 'Freelancer', 'Fashion Photographer', 'moschino'),
('freelancer_crafter', 'Freelancer', 'Crafter', 'eco_lifestyle'),
('freelancer_paranormal_investigator', 'Freelancer', 'Paranormal Investigator', 'paranormal'),
('painter_master_of_the_real', 'Painter', 'Master of the Real', 'base'),
('painter_master_of_the_arts', 'Painter', 'Master of the Arts', 'base'),
('secret_agent_diamond_agent', 'Secret Agent', 'Diamond Agent', 'base'),
('secret_agent_villain', 'Secret Agent', 'Villain', 'base'),
('self_employed', 'Self-Employed', NULL, 'base'),
('style_influencer_trendsetter', 'Style Influencer', 'Trendsetter', 'base'),
('style_influencer_stylist', 'Style Influencer', 'Stylist', 'base'),
('tech_guru_esport_gamer', 'Tech Guru', 'eSport Gamer', 'base'),
('tech_guru_start_up_entrepreneur', 'Tech Guru', 'Start-up Entrepreneur', 'base'),
('writer_author', 'Writer', 'Author', 'base'),
('writer_journalist', 'Writer', 'Journalist', 'base'),
('detective', 'Detective', NULL, 'get_to_work'),
('doctor', 'Doctor', NULL, 'get_to_work'),
('scientist', 'Scientist', NULL, 'get_to_work'),
('critic_arts_critic', 'Critic', 'Arts Critic', 'city_living'),
('critic_food_critic', 'Critic', 'Food Critic', 'city_living'),
('politician_politician', 'Politician', 'Politician', 'city_living'),
('politician_charity_organizer', 'Politician', 'Charity Organizer', 'city_living'),
('social_media_internet_personality', 'Social Media', 'Internet Personality', 'city_living'),
('social_media_public_relations', 'Social Media', 'Public Relations', 'city_living'),
('gardener_botanist', 'Gardener', 'Botanist', 'seasons'),
('gardener_floral_designer', 'Gardener', 'Floral Designer', 'seasons'),
('actor', 'Actor', NULL, 'get_famous'),
('military_covert_operator', 'Military', 'Covert Operator', 'strangerville'),
('military_officer', 'Military', 'Officer', 'strangerville'),
('conservationist_environmental_manager', 'Conservationist', 'Environmental Manager', 'island_living'),
('conservationist_marine_biologist', 'Conservationist', 'Marine Biologist', 'island_living'),
('education_administrator', 'Education', 'Administrator', 'discover_university'),
('education_professor', 'Education', 'Professor', 'discover_university'),
('engineer_computer_engineer', 'Engineer', 'Computer Engineer', 'discover_university'),
('engineer_mechanical_engineer', 'Engineer', 'Mechanical Engineer', 'discover_university'),
('law_judge', 'Law', 'Judge', 'discover_university'),
('law_private_attourney', 'Law', 'Private Attourney', 'discover_university'),
('civil_designer_civic_planner', 'Civil Designer', 'Civic Planner', 'eco_lifestyle'),
('civil_designer_green_technician', 'Civil Designer', 'Green Technician', 'eco_lifestyle'),
('salaryperson_expert', 'Salaryperson', 'Expert', 'snowy_escape'),
('salaryperson_supervisor', 'Salaryperson', 'Supervisor', 'snowy_escape'),
('interior_decorator', 'Interior Decorator', NULL, 'dream_home_decorator'),
('romance_consultant_matchmaker', 'Romance Consultant', 'Matchmaker', 'lovestruck'),
('romance_consultant_relationship_counselor', 'Romance Consultant', 'Relationship Counselor', 'lovestruck'),
('reaper', 'Reaper', NULL, 'life_and_death'),
('undertaker_funeral_director', 'Undertaker', 'Funeral Director', 'life_and_death'),
('undertaker_mortician', 'Undertaker', 'Mortician', 'life_and_death')
                --
;

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE career_branches;

DROP TYPE IF EXISTS career_branch_id;

DROP TABLE life_states;

DROP TYPE IF EXISTS life_state_id;

DROP TABLE traits;

DROP TYPE IF EXISTS trait_id;

DROP TABLE aspirations;

DROP TYPE IF EXISTS aspiration_id;

DROP TABLE ages;

DROP TYPE IF EXISTS age_id;

DROP TABLE products;

DROP TYPE IF EXISTS product_type;

DROP TYPE IF EXISTS product_id;

-- +goose StatementEnd
