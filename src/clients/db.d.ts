/**
 * This file was generated by kysely-codegen.
 * Please do not edit it manually.
 */

import type { ColumnType } from "kysely";

export type AgeId = "adult" | "child" | "elder" | "infant" | "newborn" | "teen" | "toddler" | "young_adult";

export type ArrayType<T> = ArrayTypeImpl<T> extends (infer U)[]
  ? U[]
  : ArrayTypeImpl<T>;

export type ArrayTypeImpl<T> = T extends ColumnType<infer S, infer I, infer U>
  ? ColumnType<S[], I[], U[]>
  : T[];

export type AspirationCategory = "animal" | "athletic" | "child" | "creativity" | "deviance" | "family" | "food" | "fortune" | "knowledge" | "location" | "love" | "nature" | "popularity" | "star_wars" | "teen" | "wellness" | "werewolf";

export type AspirationId = "academic" | "angling_ace" | "appliance_whiz" | "archaeology_scholar" | "beach_life" | "bestselling_author" | "big_happy_family" | "bodybuilder" | "championship_rider" | "chief_of_mischief" | "child_artistic_prodigy" | "child_creative_genius" | "child_mind_and_body" | "child_playtime_captain" | "child_rambunctious_scamp" | "child_slumber_party_animal" | "child_social_butterfly" | "child_whiz_kid" | "city_native" | "computer_whiz" | "country_caretaker" | "crystal_crafter" | "cure_seeker" | "discerning_dweller" | "eco_innovator" | "emissary_of_the_collective" | "enforcer_of_order" | "esteemed_entrepreneur" | "expert_nectar_maker" | "extreme_sports_enthusiast" | "fabulously_filthy" | "fabulously_wealthy" | "five_star_property_owner" | "fount_of_tomarani_knowledge" | "freelance_botanist" | "friend_of_the_animals" | "friend_of_the_world" | "galactic_privateer" | "ghost_historian" | "good_vampire" | "grilled_cheese" | "hope_vs_order" | "inner_peace" | "joke_star" | "jungle_explorer" | "leader_of_the_pack" | "Location" | "lone_wolf" | "lord_lady_of_the_knits" | "Love" | "mansion_baron" | "market_magnate" | "master_actor_actress" | "master_chef" | "master_maker" | "master_mentor" | "master_mixologist" | "master_vampire" | "mt_komorebi_sightsser" | "musical_genius" | "neighborhood_confidant" | "nerd_brain" | "outdoor_enthusiast" | "painter_extraordinaire" | "paragon_of_hope" | "paragon_partner" | "party_animal" | "perfectly_pristine" | "public_enemy" | "purveyor_of_potions" | "renaissance_sim" | "romantic_explorer" | "seeker_of_secrets" | "self_care_specialist" | "serial_romantic" | "soulmate" | "spellcraft_and_sorcery" | "sticky_fingers" | "strangerville_mystery" | "successful_lineage" | "super_parent" | "teen_admired_icon" | "teen_drama_llama" | "teen_goal_oriented" | "teen_live_fast" | "the_curator" | "vampire_family" | "villainous_valentine" | "werewolf_initiate" | "wildfang_renegade" | "world_famous_celebrity" | "zen_guru";

export type CareerBranchId = "actor" | "astronaut_interstellar_smuggler" | "astronaut_space_ranger" | "athlete_bodybuilder" | "athlete_professional_athlete" | "business_investor" | "business_management" | "business_owner_residential_rental" | "business_owner_restaurant" | "business_owner_retail" | "business_owner_small_business" | "business_owner_vet_clinic" | "civil_designer_civic_planner" | "civil_designer_green_technician" | "conservationist_environmental_manager" | "conservationist_marine_biologist" | "criminal_boss" | "criminal_oracle" | "critic_arts_critic" | "critic_food_critic" | "culinary_chef" | "culinary_mixologist" | "detective" | "doctor" | "education_administrator" | "education_professor" | "engineer_computer_engineer" | "engineer_mechanical_engineer" | "entertainer_comedian" | "entertainer_musician" | "freelancer_crafter" | "freelancer_digital_artist" | "freelancer_fashion_photographer" | "freelancer_paranormal_investigator" | "freelancer_programmer" | "freelancer_writer" | "gardener_botanist" | "gardener_floral_designer" | "interior_decorator" | "law_judge" | "law_private_attourney" | "military_covert_operator" | "military_officer" | "painter_master_of_the_real" | "painter_patron_of_the_arts" | "politician_charity_organizer" | "politician_politician" | "reaper" | "romance_consultant_matchmaker" | "romance_consultant_relationship_counselor" | "salaryperson_expert" | "salaryperson_supervisor" | "scientist" | "secret_agent_diamond_agent" | "secret_agent_villain" | "self_employed" | "social_media_internet_personality" | "social_media_public_relations" | "style_influencer_stylist" | "style_influencer_trendsetter" | "tech_guru_esport_gamer" | "tech_guru_start_up_entrepreneur" | "undertaker_funeral_director" | "undertaker_mortician" | "writer_author" | "writer_journalist";

export type CareerId = "actor" | "astronaut" | "athlete" | "business" | "business_owner" | "civil_designer" | "conservationist" | "criminal" | "critic" | "culinary" | "detective" | "doctor" | "education" | "engineer" | "entertainer" | "freelancer" | "gardener" | "interior_decorator" | "law" | "military" | "painter" | "politician" | "reaper" | "romance_consultant" | "salaryperson" | "scientist" | "secret_agent" | "self_employed" | "social_media" | "style_influencer" | "tech_guru" | "undertaker" | "writer";

export type DegreeId = "art_history" | "biology" | "communications" | "computer_science" | "culinary_arts" | "drama" | "economics" | "fine_art" | "history" | "language_and_literature" | "physics" | "psychology" | "villainy";

export type Generated<T> = T extends ColumnType<infer S, infer I, infer U>
  ? ColumnType<S, I | undefined, U>
  : ColumnType<T, T | undefined, T>;

export type Int8 = ColumnType<string, bigint | number | string, bigint | number | string>;

export type LifeStateId = "alien" | "ghost" | "mermaid" | "normal" | "servo" | "spellcaster" | "vampire" | "werewolf";

export type ProductId = "artist_studio" | "backyard" | "base" | "basement_treasures" | "bathroom_clutter" | "blast_from_the_past" | "book_nook" | "bowling_night" | "business_chic" | "businesses_and_hobbies" | "bust_the_dust" | "carnaval_streetwear" | "casanova_cave" | "castle_estate" | "cats_and_dogs" | "city_living" | "comfy_gamer" | "cool_kitchen" | "cottage_living" | "country_kitchen" | "courtyard_oasis" | "cozy_bistro" | "cozy_celebrations" | "cozy_kitsch" | "crystal_creations" | "decor_to_the_max" | "desert_luxe" | "dine_out" | "discover_university" | "dream_home_decorator" | "eco_lifestyle" | "everyday_clutter" | "first_fits" | "fitness" | "for_rent" | "get_famous" | "get_to_work" | "get_together" | "goth_galore" | "greenhouse_haven" | "growing_together" | "grunge_revival" | "high_school_years" | "home_chef_hustle" | "horse_ranch" | "island_living" | "jungle_adventure" | "kids_room" | "laundry_day" | "life_and_death" | "little_campers" | "lovestruck" | "luxury_party" | "modern_luxe" | "modern_menswear" | "moonlight_chic" | "moschino" | "movie_hangout" | "my_first_pet" | "my_wedding_stories" | "nifty_knitting" | "outdoor_retreat" | "paranormal" | "parenthood" | "party_essentials" | "pastel_pop" | "perfect_patio" | "poolside_splash" | "realm_of_magic" | "refined_living_room" | "riviera_retreat" | "romantic_garden" | "seasons" | "secret_sanctuary" | "simtimates_collection" | "snowy_escape" | "spa_day" | "spooky" | "star_wars_journey_to_batuu" | "storybook_nursery" | "strangerville" | "sweet_slumber_party" | "throwback_fit" | "tiny_living" | "toddler" | "urban_homage" | "vampires" | "vintage_glamour" | "werewolves";

export type ProductType = "base_game" | "event" | "expansion_pack" | "game_pack" | "kit" | "stuff_pack";

export type Timestamp = ColumnType<Date, Date | string, Date | string>;

export type TraitId = "active" | "adventurous" | "ambitious" | "angelic" | "animal_enthusiast" | "art_lover" | "bookworm" | "bro" | "calm" | "cat_lover" | "cautious" | "charmer" | "chased_by_death" | "cheerful" | "child_of_the_islands" | "child_of_the_ocean" | "child_of_the_village" | "childish" | "clingy" | "clumsy" | "creative" | "cringe" | "dance_machine" | "dog_lover" | "erratic" | "evil" | "family_oriented" | "foodie" | "freegan" | "fussy" | "geek" | "generous" | "genius" | "gloomy" | "glutton" | "good" | "goofball" | "green_fiend" | "grouch" | "hates_children" | "high_maintenance" | "horse_lover" | "hot_headed" | "idealist" | "independent" | "inquisitive" | "insider" | "intense" | "jealous" | "kleptomaniac" | "lactose_intolerant" | "lazy" | "loner" | "lovebug" | "loves_outdoors" | "loyal" | "macabre" | "maker" | "materialistic" | "mean" | "music_lover" | "neat" | "noncommittal" | "nosy" | "outgoing" | "overachiever" | "paranoid" | "party_animal" | "perfectionist" | "practice_makes_perfect" | "proper" | "rancher" | "recycle_disciple" | "romantic" | "romantically_reserved" | "self_absorbed" | "self_assured" | "sensitive" | "shady" | "silly" | "skeptical" | "slob" | "snob" | "socially_awkward" | "squeamish" | "sunny" | "unflirty" | "vegetarian" | "wiggly" | "wild" | "wise";

export interface Ages {
  id: AgeId;
  name: string;
}

export interface Aspirations {
  ages: Generated<ArrayType<AgeId>>;
  category: AspirationCategory;
  description: string;
  id: AspirationId;
  name: string;
  product: ProductId;
}

export interface CareerBranches {
  careerId: CareerId;
  description: string;
  id: CareerBranchId;
  name: string;
  product: ProductId;
}

export interface Careers {
  description: string;
  id: CareerId;
  name: string;
  product: ProductId;
}

export interface Degrees {
  id: DegreeId;
  name: string;
  product: ProductId;
}

export interface DegreesCareerBranches {
  careerBranchId: CareerBranchId;
  degreeId: DegreeId;
}

export interface LifeStates {
  id: LifeStateId;
  name: string;
}

export interface Otps {
  createdAt: Generated<Timestamp>;
  email: string;
  expiresAt: Timestamp;
  otp: string;
}

export interface Products {
  id: ProductId;
  name: string;
  releaseDate: Timestamp;
  type: ProductType;
}

export interface Sessions {
  createdAt: Generated<Timestamp>;
  expiresAt: Timestamp;
  id: Generated<Int8>;
  token: string;
  userId: Int8;
}

export interface Sims {
  ageId: AgeId;
  createdAt: Generated<Timestamp>;
  firstName: string;
  galleryId: string | null;
  id: Generated<Int8>;
  isDeceased: Generated<boolean>;
  lastName: string;
  lifeStateId: Generated<LifeStateId>;
  name: Generated<string>;
  parent1Id: Int8 | null;
  parent2Id: Int8 | null;
  story: Generated<string>;
  updatedAt: Generated<Timestamp>;
}

export interface SimsAspirations {
  ageId: AgeId;
  aspirationId: AspirationId;
  isComplete: Generated<boolean>;
  simId: Int8;
}

export interface SimsCareerBranches {
  careerBranchId: CareerBranchId;
  simId: Int8;
}

export interface SimsImages {
  ageId: AgeId;
  imageUri: string;
  simId: Int8;
  updatedAt: Generated<Timestamp>;
}

export interface SimsTraits {
  ageId: AgeId;
  simId: Int8;
  traitId: TraitId;
}

export interface TraitConflicts {
  conflictTraitId: TraitId;
  traitId: TraitId;
}

export interface Traits {
  ages: Generated<ArrayType<AgeId>>;
  description: string;
  id: TraitId;
  name: string;
  product: ProductId;
}

export interface Users {
  createdAt: Generated<Timestamp>;
  email: string;
  id: Generated<Int8>;
  isTestUser: Generated<boolean>;
  updatedAt: Generated<Timestamp>;
}

export interface DB {
  ages: Ages;
  aspirations: Aspirations;
  careerBranches: CareerBranches;
  careers: Careers;
  degrees: Degrees;
  degreesCareerBranches: DegreesCareerBranches;
  lifeStates: LifeStates;
  otps: Otps;
  products: Products;
  sessions: Sessions;
  sims: Sims;
  simsAspirations: SimsAspirations;
  simsCareerBranches: SimsCareerBranches;
  simsImages: SimsImages;
  simsTraits: SimsTraits;
  traitConflicts: TraitConflicts;
  traits: Traits;
  users: Users;
}
