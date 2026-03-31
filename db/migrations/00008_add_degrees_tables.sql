-- +goose Up
-- +goose StatementBegin
CREATE TYPE degree_id AS ENUM(
        'art_history',
        'biology',
        'communications',
        'computer_science',
        'culinary_arts',
        'drama',
        'economics',
        'fine_art',
        'history',
        'language_and_literature',
        'physics',
        'psychology',
        'villainy'
);

CREATE TABLE degrees (
        id degree_id PRIMARY KEY,
        name text NOT NULL,
        product product_id REFERENCES products(id) NOT NULL
);

INSERT INTO degrees(id, name, product)
        VALUES
                --
('art_history', 'Art History', 'discover_university'),
('biology', 'Biology', 'discover_university'),
('communications', 'Communications', 'discover_university'),
('computer_science', 'Computer Science', 'discover_university'),
('culinary_arts', 'Culinary Arts', 'discover_university'),
('drama', 'Drama', 'discover_university'),
('economics', 'Economics', 'discover_university'),
('fine_art', 'Fine Art', 'discover_university'),
('history', 'History', 'discover_university'),
('language_and_literature', 'Language & Literature', 'discover_university'),
('physics', 'Physics', 'discover_university'),
('psychology', 'Psychology', 'discover_university'),
('villainy', 'Villainy', 'discover_university')
                --
;

CREATE TABLE degrees_career_branches(
        degree_id degree_id REFERENCES degrees(id) ON DELETE CASCADE NOT NULL,
        career_branch_id career_branch_id REFERENCES career_branches(id) ON DELETE CASCADE NOT NULL,
        UNIQUE (degree_id, career_branch_id)
);

INSERT INTO degrees_career_branches(degree_id, career_branch_id)
        VALUES
                -- art_history
('art_history', 'critic_arts_critic'),
('art_history', 'painter_patron_of_the_arts'),
('art_history', 'style_influencer_trendsetter'),
                -- biology
('biology', 'athlete_bodybuilder'),
('biology', 'conservationist_marine_biologist'),
('biology', 'doctor'),
('biology', 'gardener_botanist'),
('biology', 'undertaker_mortician'),
                -- Communications
('communications', 'business_management'),
('communications', 'civil_designer_civic_planner'),
('communications', 'politician_charity_organizer'),
('communications', 'salaryperson_supervisor'),
('communications', 'social_media_public_relations'),
('communications', 'writer_journalist'),
                -- Computer Science
('computer_science', 'criminal_oracle'),
('computer_science', 'engineer_computer_engineer'),
('computer_science', 'freelancer_programmer'),
('computer_science', 'salaryperson_expert'),
('computer_science', 'tech_guru_start_up_entrepreneur'),
                -- Culinary Arts
('culinary_arts', 'critic_food_critic'),
('culinary_arts', 'culinary_chef'),
                -- Drama
('drama', 'actor'),
('drama', 'entertainer_comedian'),
('drama', 'social_media_internet_personality'),
                -- Economics
('economics', 'business_investor'),
('economics', 'conservationist_environmental_manager'),
('economics', 'education_administrator'),
                -- Fine Art
('fine_art', 'entertainer_musician'),
('fine_art', 'freelancer_crafter'),
('fine_art', 'freelancer_digital_artist'),
('fine_art', 'freelancer_fashion_photographer'),
('fine_art', 'gardener_floral_designer'),
('fine_art', 'painter_master_of_the_real'),
('fine_art', 'style_influencer_stylist'),
                -- History
('history', 'law_judge'),
('history', 'military_officer'),
('history', 'politician_politician'),
                -- Language & Literature
('language_and_literature', 'freelancer_writer'),
('language_and_literature', 'law_private_attourney'),
('language_and_literature', 'reaper'),
('language_and_literature', 'writer_author'),
                -- Physics
('physics', 'astronaut_space_ranger'),
('physics', 'civil_designer_green_technician'),
('physics', 'engineer_mechanical_engineer'),
('physics', 'scientist'),
                -- Psychology
('psychology', 'detective'),
('psychology', 'education_professor'),
('psychology', 'military_covert_operator'),
('psychology', 'secret_agent_diamond_agent'),
('psychology', 'undertaker_funeral_director'),
                -- Villainy
('villainy', 'criminal_boss'),
('villainy', 'astronaut_interstellar_smuggler'),
('villainy', 'secret_agent_villain')
                --
;

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE degrees_career_branches;

DROP TABLE degrees;

DROP TYPE degree_id;

-- +goose StatementEnd
