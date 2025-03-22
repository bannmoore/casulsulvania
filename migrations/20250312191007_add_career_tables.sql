-- +goose Up
-- +goose StatementBegin
CREATE TYPE career_id AS ENUM(
        'astronaut',
        'athlete',
        'business',
        'criminal',
        'culinary',
        'entertainer',
        'freelancer',
        'painter',
        'secret_agent',
        'self_employed',
        'style_influencer',
        'tech_guru',
        'writer',
        'detective',
        'doctor',
        'scientist',
        'critic',
        'politician',
        'social_media',
        'gardener',
        'actor',
        'military',
        'conservationist',
        'education',
        'engineer',
        'law',
        'civil_designer',
        'salaryperson',
        'interior_decorator',
        'romance_consultant',
        'reaper',
        'undertaker'
        --
);

CREATE TABLE careers(
        id career_id PRIMARY KEY,
        name text NOT NULL,
        description text NOT NULL,
        product product_id REFERENCES products(id) NOT NULL
);

INSERT INTO careers(id, name, product, description)
        VALUES
                --
('astronaut', 'Astronaut', 'base', 'Who doesn''t dream of going to space? Become an astronaut and the galaxy will be your playground.'),
('athlete', 'Athlete', 'base', 'An athlete requires physical strength, speed, endurance, and intelligence. Start a career where enthusiastic fans will shout your name, wear your jersey, and remember your feats forever.'),
('business', 'Business', 'base', 'Synergy! Efficiency! Planfulness! If the mere sound of these industry buzzwords gets you buzzing, then a career in business might just be the right fit for you!'),
('criminal', 'Criminal', 'base', 'Not every Sim wants to play by the rules. You can make tons of Simoleons and have fun, too, as an outlaw.'),
('culinary', 'Culinary', 'base', 'Anyone can make dinner or mix a drink at home. The Culinary career is for those who want to take it to another level and make money doing it.'),
('entertainer', 'Entertainer', 'base', 'You''ve wanted your name in lights from the time you could spell it, maybe even before. Answer your calling and claim your fame as a professional entertainer, either making the audience laugh with you or melting their hearts with your melodies.'),
('freelancer', 'Freelancer', 'base', 'Be your own boss! Set your own work schedule! Sounds good, right? If you''re both self-disciplined and determined, a career as a freelancer may be the right path for you. Multiple trades available to work within; agencies are standing by to connect you with eager clients today!'),
('painter', 'Painter', 'base', 'Create your own world with a few strokes of a brush! Make a place for yourself in the art world with hyperreal masterpieces or abstract works of unsettling beauty.'),
('secret_agent', 'Secret Agent', 'base', 'Live life unnoticed as a covert operative. From infiltrating enemy headquarters to the art of interrogation, the more you learn, the less you’ll be known.'),
('self_employed', 'Self-Employed', 'base', ''),
('style_influencer', 'Style Influencer', 'base', 'By identifying the right colors, the trendy patterns, the unseen ensemble pairings, and identifying the right person to act as a vehicle for such insight, the Style Influencer can twist the world towards a more cohesive end.'),
('tech_guru', 'Tech Guru', 'base', 'Who needs college with programming skills like yours? Opportunity is out there, ripe for the picking, and you and your big brain are ready to pluck away.'),
('writer', 'Writer', 'base', 'Get paid to express your ideas with beautiful turns of phrase, and words—wonderful words!'),
('detective', 'Detective', 'get_to_work', 'Do you want to be the type of cop who''s never really off-duty? If so, this job''s for you and we''ve got the rewards to support that unhealthy lifestyle! Unlock outfits like your Police Uniform to wear as pajamas. Teach your teen a valuable lesson for that C+ by dressing them in Prisoner Coveralls and transforming their bedroom into a virtual jail cell complete with Prison Bar Walls and a decorative Security Camera. As a bonus, you can keep an eye on them with your very own One-Way Mirror.'),
('doctor', 'Doctor', 'get_to_work', 'Who doesn''t want to be held responsible for another Sim''s health and well-being? A Doctor who can advance in the medical ranks will find themselves rewarded with objects like a Standing Surgical Light and a Full-Sized Skeleton to brighten up the home nursery. To make the deal extra sweet, you''ll be able to unlock your very own Hospital Scrubs and Patient Scrubs so you can play Doctor at home!'),
('scientist', 'Scientist', 'get_to_work', 'Calling all brains! Are you the nerdy type who aspires to one day wear tin foil on your head and decorate your studio with huge bubbly tanks? A Scientist who proves they''ve got the gray matter to change the world as we know it can unlock new outfits like the UFO hunter or objects like a swanky Chemistry Lab for concoting new inventions and serums.'),
('critic', 'Critic', 'city_living', 'Everyone has an opinion. But not everyone is paid to have it! Sims who feel they have superior judgement can enter the Critic Career. Whether it’s the foods or the arts, your Sim will have something to say about it, and others WILL listen.'),
('politician', 'Politician', 'city_living', 'Join a life of public service! From protesting against the unjust, to gathering donations for good causes, or even collecting the occasional bribe as a "means to an end", Politics is always interesting.'),
('social_media', 'Social Media', 'city_living', 'What''s trending? Where''s the best food in town? Who''s the most interesting celebrity?
Start a career in Social Media to be the person that answers these questions for their followers. Blog and check-in at venues to keep followers coming back for more."'),
('gardener', 'Gardener', 'seasons', 'You''ve always had a green thumb, but now you think you can earn some green with it. You''ll start by doing a lot of planting and gardening, but keep at it, and you can find success in the science, or art, in doing so.'),
('actor', 'Actor', 'get_famous', 'The spotlight calls, the cameras are focused, and you are ready for your closeup. It is up to you to breathe energy into the words of the script and really make the characters come alive.'),
('military', 'Military', 'strangerville', 'Physical fitness and discipline will be the keys to success in the Military career. Rising through the ranks will not come easy unless you can demonstrate your physical prowess as well as your ability to recruit and be a leader. Will you pursue the path of a Grand Marshal, or will you follow a more secretive path to uncover what others might be hiding?'),
('conservationist', 'Conservationist', 'island_living', 'You''ve watched every nature documentary out there, and you know just how much the planet is in danger. From educating the public to performing research expeditions, you want to truly make a difference. Change won''t happen overnight, but keep at it and your hard work can lead to thriving ecosystems!'),
('education', 'Education', 'discover_university', 'Shape tomorrow''s minds with a career in Education. Though, at times, challenging, there are few jobs quite as rewarding'),
('engineer', 'Engineer', 'discover_university', 'There are many problems in the world that require modern and creative solutions. Take your love of technology and pursue a career in engineering to solve the world''s problems with computers and mechanical gadgetry!'),
('law', 'Law', 'discover_university', 'Sims who pursue a career in law are in a unique position to help others with their legal problems, champion causes, and further the public good (or not). That fancy paycheck doesn''t hurt either!'),
('civil_designer', 'Civil Designer', 'eco_lifestyle', 'As a Civil Designer, get involved in planning and designing solutions to all kinds of environmental problems, and chat to your fellow Sims about how to make their world a better place to live.'),
('salaryperson', 'Salaryperson', 'snowy_escape', 'Dedicating your life to the Farseer Data Corporation and putting its needs above all else is just the first step for a Salaryperson. Stability, respect, and endless hours of work are in your future. Advance to be a Supervisor or a [sic] Expert in your field all while enjoying morning commutes and evening Karaoke.'),
('interior_decorator', 'Interior Decorator', 'dream_home_decorator', 'Being an Interior Decorator is about two things: Having a good eye for design, and Building relationships with Clients. Having people skills and some artistic vision will lead to a bright future and possible recognition. You may start small with some simple home renovations, but eventually with enough hard work, bigger Clients and buildings could get you the recognition you deserve!'),
('romance_consultant', 'Romance Consultant', 'lovestruck', 'Are you a natural at interpreting feelings, a sucker for love, and interested in helping others find their happily ever after? You may be destined to be a Romance Consultant!'),
('reaper', 'Reaper', 'life_and_death', 'The time is nigh to don a robe and become a Reaper! As Grim''s employee, you''ll be able to climb his triangular ladder and gain rewards like Discussing Deathly Business and owning a Timeless Hourglass. Scry your way to the top and earn being Grim''s Right Hand while unlocking a truly Grim-worthy outfit as you spread Death''s Touch wherever you go.'),
('undertaker', 'Undertaker', 'life_and_death', 'Service both the living and the dead by undertaking this position! From grave digging to embalming, Sims who pursue a career in the funeral industry ensure all Sims are able to move on in peace. Specializing in this before-afterlife care prepares you for difficult moments like, Discussing End of Life services or Contemplating Existence. Six feet in you may be rewarded with a Plague Mask, a Murphy Membrane Bust, or a Corpus Commendation Plaque to honor your achievements."')
                --
;

CREATE TYPE career_branch_id AS ENUM(
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
        'freelancer_paranormal_investigator',
        'painter_master_of_the_real',
        'painter_patron_of_the_arts',
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
        career_id career_id REFERENCES careers(id) ON DELETE CASCADE NOT NULL,
        name text NOT NULL,
        description text NOT NULL,
        product product_id REFERENCES products(id) NOT NULL
);

INSERT INTO career_branches(id, career_id, name, product, description)
        VALUES
                --
('astronaut_space_ranger', 'astronaut', 'Astronaut - Space Ranger', 'base', 'Space is wild and unruly - a bit too unruly. Taking a post in the Planet Patrol ensures that space remains safe for future generations.'),
('astronaut_interstellar_smuggler', 'astronaut', 'Astronaut - Interstellar Smuggler', 'base', 'The Sim who wrangles the most of the stars takes advantage of the ungoverned frontier. Take any job - even if it doesn''t touch the ground.'),
('athlete_professional_athlete', 'athlete', 'Athlete - Professional Athlete', 'base', 'Are you a physical specimen with the motor, ambition, and natural talent to compete with the best? Want to earn a living playing a game that you played as a child? Then a career as a Professional Athlete is for you! Live the lifestyle and entertain the masses with your athletic ability.'),
('athlete_bodybuilder', 'athlete', 'Athlete - Bodybuilder', 'base', 'As a master of muscle, you will partake in a life of fitness, nutrition, and weight training. Train fellow Sims, show off feats of strength to adoring fans, and sculpt your body into the form of a god.'),
('business_management', 'business', 'Business - Management', 'base', 'Should everyone be laid off and replaced by robots? Should the company logo be redone to include more llamas? These are the types of critical decisions you would be making should you choose to venture down the path of management.'),
('business_investor', 'business', 'Business - Investor', 'base', 'It takes Simoleons to make Simoleons. Optimize your investments through diligent research and try to turn piles of Simoleons into even bigger piles of Simoleons!'),
('criminal_boss', 'criminal', 'Criminal - Boss', 'base', 'The streets are your playground. You know there are only two paths: up to the top, or down with the fishes. You? You''re going up.'),
('criminal_oracle', 'criminal', 'Criminal - Oracle', 'base', 'Why be part of the machine, when you can take it down? There are plenty of ways to skin a cat, or an enterprise, and you''ll figure them out."'),
('culinary_chef', 'culinary', 'Culinary - Chef', 'base', 'It takes a special touch to craft exquisite food. Begin your journey of making Sims weak in the knees with a dangerously delicious dish.'),
('culinary_mixologist', 'culinary', 'Culinary - Mixologist', 'base', 'A master mixologist knows the ins and outs of various mixers and ingredients to create a drink that makes the shyest Sim sit up and notice."'),
('entertainer_musician', 'entertainer', 'Entertainer - Musician', 'base', 'The gift of music simply must be shared! Tickle those keys and strum those strings as your adoring fans fall in love with every melody!'),
('entertainer_comedian', 'entertainer', 'Entertainer - Comedian', 'base', 'The life of a professional comedian isn''t all funny business, so practice those impressions and prepare your best topical jokes!'),
('freelancer_digital_artist', 'freelancer', 'Freelancer - Digital Artist', 'base', 'Can a digital painting make you cry? Right now, no one knows. This is partly because many would consider this very idea frivolous. But it''s also because whoever successfully answers this questioned must first have answered several others. Why do we cry? Why do we laugh, or love, or smile? What are the touchstones of our emotions?

Until now, the people who asked such questions tended not to be the same people who created digital art. Instead, they were writers, filmmakers, painters, musicians, they were, in the traditional sense, artists.

We''re about to change that tradition. The name of our agency is Electrified Artists.'),
('freelancer_programmer', 'freelancer', 'Freelancer - Programmer', 'base', 'Want in on a little secret? You don''t have to be an expert about computers to be a great freelancer! All you need is a PC, a search engine, and the iron will to deal with "ideas people". Still, it helps to be an expert.'),
('freelancer_writer', 'freelancer', 'Freelancer - Writer', 'base', 'When people see us in the street, they point and exclaim "Them''s Fighting Words!" Okay they don''t. Perhaps someday. We handle jobs ranging from proofreading to ghost writing for famous people. Grab a keyboard, boot up your favourite word processor, and join us!'),
('freelancer_fashion_photographer', 'freelancer', 'Freelancer - Fashion Photographer', 'moschino', 'Tomorrow''s Style represents and gets you the fashion shoots you need. Sure, you might get stuck with a department store catalog, but work hard and you might just shoot the next high fashion collection warn by celebrities at the Starlight Accolades.
Hire photo subjects, select the clothes, set the subjects in the appropriate poses, and capture the magic. Build a home photo studio, or take your camera and tripod on location to get the best shots. Don''t forget to self-promote by uploading your photos to Fashion Simstagram.'),
('freelancer_crafter', 'freelancer', 'Freelancer - Crafter', 'eco_lifestyle', 'SIMply Crafted''s mission is to deliver hand-crafted and responsibly sourced goodies to the eco-conscious Sims of the world.
On demand, at your fingertips, devoid of guilt. So light up your Candles, sip your Fizzy Juice, and relax on your Couch knowing that they were all dipped, upcycled, or fizzed with love by a true artisan.

This note was printed on digitally recycled paper.'),
('freelancer_paranormal_investigator', 'freelancer', 'Freelancer - Paranormal Investigator', 'paranormal', 'Do you have spirits in your house? Do you keep finding creepy dolls in your attic? Do you ever hear creepy voices outside your head? Know this. Specters are out there, and they''re kinda jerks.
If you''ve been certified as a Paranormal Investigator, you''re welcome to join ranks of our elite phantom patrollers. As an agent it''s up to you to make this world a little less spooky.'),
('painter_master_of_the_real', 'painter', 'Painter - Master of the Real', 'base', 'You have Real Talent, and now others are starting to recognize it. Live your art, treat it with gravitas, and all the world shall follow.'),
('painter_patron_of_the_arts', 'painter', 'Painter - Patron of the Arts', 'base', 'Your taste in art is impeccable, and you can make Great Things happen. Show off what you know as a Patron of the Arts.'),
('secret_agent_diamond_agent', 'secret_agent', 'Secret Agent - Diamond Agent', 'base', 'You''ve risen through the ranks and have unparalled [sic] clearance. As a Diamond Agent, every mission is critical- -and no misstep forgiven.'),
('secret_agent_villain', 'secret_agent', 'Secret Agent - Villain', 'base', 'Your superior intelligence and training are too great to waste on doing good. So why not be the best among the world’s worst?'),
('self_employed', 'self_employed', 'Self-Employed', 'base', ''),
('style_influencer_trendsetter', 'style_influencer', 'Style Influencer - Trendsetter', 'base', 'The task of a Trendsetter is to create trends through the medium of fashion and clothing. By affecting the look of the world, true peace may be achieved in our time.'),
('style_influencer_stylist', 'style_influencer', 'Style Influencer - Stylist', 'base', 'Voila! A snip here, a trim there, a pairing of this with that, and boom, a new dash of fashionable zoosh. Snap snap snap, that new title? It’s so in right now.'),
('tech_guru_esport_gamer', 'tech_guru', 'Tech Guru - eSport Gamer', 'base', 'You’ve been living and breathing videogames since the moment you could twitch your trigger finger, and as an eSport Gamer, you can cash in on that.'),
('tech_guru_start_up_entrepreneur', 'tech_guru', 'Tech Guru - Start-up Entrepreneur', 'base', 'Turn your Big Ideas into household names as a Start-up Genius. It''ll take savvy and connections, but fortune is within your reach.'),
('writer_author', 'writer', 'Writer - Author', 'base', 'If you love the freedom to embellish and invent, the Author’s life is for you. Call up a character, chase after a tale.... The written word is yours.'),
('writer_journalist', 'writer', 'Writer - Journalist', 'base', 'Words can be powerful weapons, when used to expose the truth. As a Journalist, you’ll dig up important dirt and scatter it for all to see.'),
('detective', 'detective', 'Detective', 'get_to_work', 'Do you want to be the type of cop who''s never really off-duty? If so, this job''s for you and we''ve got the rewards to support that unhealthy lifestyle! Unlock outfits like your Police Uniform to wear as pajamas. Teach your teen a valuable lesson for that C+ by dressing them in Prisoner Coveralls and transforming their bedroom into a virtual jail cell complete with Prison Bar Walls and a decorative Security Camera. As a bonus, you can keep an eye on them with your very own One-Way Mirror.'),
('doctor', 'doctor', 'Doctor', 'get_to_work', 'Who doesn''t want to be held responsible for another Sim''s health and well-being? A Doctor who can advance in the medical ranks will find themselves rewarded with objects like a Standing Surgical Light and a Full-Sized Skeleton to brighten up the home nursery. To make the deal extra sweet, you''ll be able to unlock your very own Hospital Scrubs and Patient Scrubs so you can play Doctor at home!'),
('scientist', 'scientist', 'Scientist', 'get_to_work', 'Calling all brains! Are you the nerdy type who aspires to one day wear tin foil on your head and decorate your studio with huge bubbly tanks? A Scientist who proves they''ve got the gray matter to change the world as we know it can unlock new outfits like the UFO hunter or objects like a swanky Chemistry Lab for concoting new inventions and serums.'),
('critic_arts_critic', 'critic', 'Critic - Arts Critic', 'city_living', 'Set the standard for all artistic endeavors.'),
('critic_food_critic', 'critic', 'Critic - Food Critic', 'city_living', 'If you don''t love it, they won''t eat it.'),
('politician_politician', 'politician', 'Politician - Politician', 'city_living', 'Secure votes, give speeches, and become the National Leader! Better brush up on your public policy!'),
('politician_charity_organizer', 'politician', 'Politician - Charity Organizer', 'city_living', 'Use your political prowess for the greater good. Raise money and fund a solution for the Cause you support!'),
('social_media_internet_personality', 'social_media', 'Social Media - Internet Personality', 'city_living', 'Internet fame can be for anyone. Continue to build your army of followers through pranks and jokes, all while working towards complete internet stardom!'),
('social_media_public_relations', 'social_media', 'Social Media - Public Relations', 'city_living', 'Going corporate is not always a bad thing, it gives a view to the highest level of celebrities and publicizing large products. Convincing people to show off is one of your best skills. There is nothing too big for you to spin in your favor."'),
('gardener_botanist', 'gardener', 'Gardener - Botanist', 'seasons', 'Do you have an interest in the science side of plants? Then use your knowledge to improve on nature! Botanists will analyze plants, write papers, and can eventually earn grants. You''ll also be eaten by...er...work with a lot of Cowplants.'),
('gardener_floral_designer', 'gardener', 'Gardener - Floral Designer', 'seasons', 'Floral Designers will grow and use plants as their artistic medium. The main creative outlet will be using the Flower Arranging Table to create masterpieces. But you''ll start by trimming steams and leaves.'),
('actor', 'actor', 'Actor', 'get_famous', 'The spotlight calls, the cameras are focused, and you are ready for your closeup. It is up to you to breathe energy into the words of the script and really make the characters come alive.'),
('military_covert_operator', 'military', 'Military - Covert Operator', 'strangerville', 'The Covert Ops Branch is the part of the Military that no one talks about. You will be required to undergo secret tasks, by planting bugs and listening in on the unsuspecting. You will need to interrogate any and all suspicious individuals. No one can be trusted, and everyone is up to something. Are you up for the task?'),
('military_officer', 'military', 'Military - Officer', 'strangerville', 'In the Officer Branch you will continue to earn medals while you rise through the formal ranks of the Military. The Officer path will see you earning the highest rank possible and becoming a Grand Marshal. To build your leadership skills you will be tasked to order others and build to peak physical fitness. No Grand Marshal can be outdone by a Raw Recruit!'),
('conservationist_environmental_manager', 'conservationist', 'Conservationist - Environmental Manager', 'island_living', 'Use your expertise to consult on environmental policies, secure grants, and spread awareness to the masses. It''s time to widen the scope of your work!'),
('conservationist_marine_biologist', 'conservationist', 'Conservationist - Marine Biologist', 'island_living', 'From coral reefs to sea turtles, show your love of marine life and the sea. The ocean calls to you!'),
('education_administrator', 'education', 'Education - Administrator', 'discover_university', 'Sims pursuing a career in university administration will fill a variety of roles, all critical to the success of the larger institution. You don''t work directly with the students, but your decisions will impact their entire educational experience and their lives for years to come.'),
('education_professor', 'education', 'Education - Professor', 'discover_university', 'Pursue a career as a university professor. Run lectures, assist students, research for the university, and of course, assign grades!'),
('engineer_computer_engineer', 'engineer', 'Engineer - Computer Engineer', 'discover_university', 'The future is in the hands of Computer Engineers building worlds within worlds to keep our own chugging along efficiently. Rewards include the Computer Glasses'),
('engineer_mechanical_engineer', 'engineer', 'Engineer - Mechanical Engineer', 'discover_university', 'It''s going to take more than software to bring the world into the 22nd Century. That''s where Mechanical Engineering comes in! Rewards include the ExoMech Suit and Helmet.'),
('law_judge', 'law', 'Law - Judge', 'discover_university', 'Judges preside over court proceedings and conduct trials in an impartial and lawful manner. Armed with a gavel and decked out in judicial robes, they wield constitutional authority.'),
('law_private_attourney', 'law', 'Law - Private Attourney', 'discover_university', 'Handling legal cases, practicing law in court, and recruiting high profile clients, it''s all the name of the game when you''re a Private Attorney. Work hard, win your cases, and you might make Partner.'),
('civil_designer_civic_planner', 'civil_designer', 'Civil Designer - Civic Planner', 'eco_lifestyle', 'Planning is a passion of the Civic Planner, so get out into the world and canvas, rally and generally enthuse local Sims to improve their environment."'),
('civil_designer_green_technician', 'civil_designer', 'Civil Designer - Green Technician', 'eco_lifestyle', 'Green Technicians use all of their craft and ingenuity to design and construct new gadgetry and processes to greenify and enrich Sims'' lives.'),
('salaryperson_expert', 'salaryperson', 'Salaryperson - Expert', 'snowy_escape', 'Experts are needed in all fields. You don''t limit yourself. You are an expert in everything that your boss needs you to be. You are the first and last call teams make when working on difficult problems.'),
('salaryperson_supervisor', 'salaryperson', 'Salaryperson - Supervisor', 'snowy_escape', 'The corporate hive mind does not function without a endless number of team leads. Join their legion and become a Supervisor. Increase productivity by hundredths of a percent through inspirational team exercises.'),
('interior_decorator', 'interior_decorator', 'Interior Decorator', 'dream_home_decorator', 'Being an Interior Decorator is about two things: Having a good eye for design, and Building relationships with Clients. Having people skills and some artistic vision will lead to a bright future and possible recognition. You may start small with some simple home renovations, but eventually with enough hard work, bigger Clients and buildings could get you the recognition you deserve!'),
('romance_consultant_matchmaker', 'romance_consultant', 'Romance Consultant - Matchmaker', 'lovestruck', 'If you are skilled at connecting hearts, using your intuition and professional skills to help individuals find their perfect match - look no further, the Matchmaker career is for you."'),
('romance_consultant_relationship_counselor', 'romance_consultant', 'Romance Consultant - Relationship Counselor', 'lovestruck', 'Do you have the ability to help Sims face their fears, work through their emotions, and find love again in relationships? The Relationship Counselor path might be for you!'),
('reaper', 'reaper', 'Reaper', 'life_and_death', 'The time is nigh to don a robe and become a Reaper! As Grim''s employee, you''ll be able to climb his triangular ladder and gain rewards like Discussing Deathly Business and owning a Timeless Hourglass. Scry your way to the top and earn being Grim''s Right Hand while unlocking a truly Grim-worthy outfit as you spread Death''s Touch wherever you go.'),
('undertaker_funeral_director', 'undertaker', 'Undertaker - Funeral Director', 'life_and_death', 'Funeral Directors can offer a clean tissue and a stunning floral arrangement. From clerical work to rites of passage, viewings to processions, the director helps handle death''s aftermath with grace.'),
('undertaker_mortician', 'undertaker', 'Undertaker - Mortician', 'life_and_death', 'Morticians embody the science side of death. They''re likely to endure wacky chemical fumes and makeup mishaps while regularly getting the cold shoulder from clients. Ultimately, they''ll need to excel in preparations for any wake without waking the dead.')
                --
;

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE career_branches;

DROP TYPE career_branch_id;

DROP TABLE careers;

DROP TYPE career_id;

-- +goose StatementEnd
