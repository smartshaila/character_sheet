# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150609114538) do

  create_table "abilities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adventuring_classes", force: true do |t|
    t.string   "name"
    t.integer  "hit_die"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "armors", force: true do |t|
    t.integer  "item_id"
    t.integer  "base_ac"
    t.integer  "max_ability"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "armors", ["item_id"], name: "index_armors_on_item_id"

  create_table "campaigns", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_abilities", force: true do |t|
    t.integer  "character_id"
    t.integer  "ability_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "character_abilities", ["ability_id"], name: "index_character_abilities_on_ability_id"
  add_index "character_abilities", ["character_id"], name: "index_character_abilities_on_character_id"

  create_table "character_features", force: true do |t|
    t.integer  "character_id"
    t.integer  "feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "character_features", ["character_id"], name: "index_character_features_on_character_id"
  add_index "character_features", ["feature_id"], name: "index_character_features_on_feature_id"

  create_table "character_skills", force: true do |t|
    t.integer  "character_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "proficiency_multiplier"
  end

  add_index "character_skills", ["character_id"], name: "index_character_skills_on_character_id"
  add_index "character_skills", ["skill_id"], name: "index_character_skills_on_skill_id"

  create_table "characters", force: true do |t|
    t.string   "name"
    t.string   "race"
    t.string   "alignment"
    t.integer  "current_xp"
    t.integer  "max_hp"
    t.integer  "current_hp"
    t.integer  "speed"
    t.text     "notes"
    t.boolean  "has_inspiration"
    t.integer  "adventuring_class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id"
    t.integer  "campaign_id"
  end

  add_index "characters", ["adventuring_class_id"], name: "index_characters_on_adventuring_class_id"
  add_index "characters", ["campaign_id"], name: "index_characters_on_campaign_id"
  add_index "characters", ["player_id"], name: "index_characters_on_player_id"

  create_table "class_proficiencies", force: true do |t|
    t.integer  "adventuring_class_id"
    t.integer  "ability_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "class_proficiencies", ["ability_id"], name: "index_class_proficiencies_on_ability_id"
  add_index "class_proficiencies", ["adventuring_class_id"], name: "index_class_proficiencies_on_adventuring_class_id"

  create_table "class_spells", force: true do |t|
    t.integer  "adventuring_class_id"
    t.integer  "subclass_id"
    t.integer  "spell_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "class_spells", ["adventuring_class_id"], name: "index_class_spells_on_adventuring_class_id"
  add_index "class_spells", ["spell_id"], name: "index_class_spells_on_spell_id"
  add_index "class_spells", ["subclass_id"], name: "index_class_spells_on_subclass_id"

  create_table "damage_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorite_spells", force: true do |t|
    t.integer  "player_id"
    t.integer  "spell_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorite_spells", ["player_id"], name: "index_favorite_spells_on_player_id"
  add_index "favorite_spells", ["spell_id"], name: "index_favorite_spells_on_spell_id"

  create_table "features", force: true do |t|
    t.string   "name"
    t.text     "descriptin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", force: true do |t|
    t.integer  "character_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.boolean  "is_private"
    t.string   "location"
    t.boolean  "is_equipped"
    t.integer  "weapon_id"
    t.integer  "magic_id"
    t.integer  "magic_bonus"
    t.string   "name"
    t.text     "description"
    t.decimal  "weight"
    t.decimal  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inventories", ["character_id"], name: "index_inventories_on_character_id"
  add_index "inventories", ["item_id"], name: "index_inventories_on_item_id"
  add_index "inventories", ["magic_id"], name: "index_inventories_on_magic_id"
  add_index "inventories", ["weapon_id"], name: "index_inventories_on_weapon_id"

  create_table "item_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "weight"
    t.decimal  "value"
    t.integer  "item_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["item_type_id"], name: "index_items_on_item_type_id"

  create_table "known_spells", force: true do |t|
    t.integer  "character_id"
    t.integer  "spell_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "known_spells", ["character_id"], name: "index_known_spells_on_character_id"
  add_index "known_spells", ["spell_id"], name: "index_known_spells_on_spell_id"

  create_table "level_progressions", force: true do |t|
    t.integer  "level"
    t.integer  "proficiency"
    t.integer  "min_xp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magic_schools", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magics", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "magics", ["item_id"], name: "index_magics_on_item_id"

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prepared_spells", force: true do |t|
    t.integer  "character_id"
    t.integer  "spell_id"
    t.boolean  "is_cast"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prepared_spells", ["character_id"], name: "index_prepared_spells_on_character_id"
  add_index "prepared_spells", ["spell_id"], name: "index_prepared_spells_on_spell_id"

  create_table "range_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.integer  "ability_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["ability_id"], name: "index_skills_on_ability_id"

  create_table "spell_castings", force: true do |t|
    t.integer  "spell_id"
    t.integer  "time_increment_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spell_castings", ["spell_id"], name: "index_spell_castings_on_spell_id"
  add_index "spell_castings", ["time_increment_id"], name: "index_spell_castings_on_time_increment_id"

  create_table "spell_durations", force: true do |t|
    t.integer  "spell_id"
    t.integer  "time_increment_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spell_durations", ["spell_id"], name: "index_spell_durations_on_spell_id"
  add_index "spell_durations", ["time_increment_id"], name: "index_spell_durations_on_time_increment_id"

  create_table "spell_known_progressions", force: true do |t|
    t.integer  "adventuring_class_id"
    t.integer  "subclass_id"
    t.integer  "level_progression_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spell_known_progressions", ["adventuring_class_id"], name: "index_spell_known_progressions_on_adventuring_class_id"
  add_index "spell_known_progressions", ["level_progression_id"], name: "index_spell_known_progressions_on_level_progression_id"
  add_index "spell_known_progressions", ["subclass_id"], name: "index_spell_known_progressions_on_subclass_id"

  create_table "spell_materials", force: true do |t|
    t.integer  "spell_id"
    t.text     "description"
    t.integer  "value"
    t.boolean  "is_consumed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spell_materials", ["spell_id"], name: "index_spell_materials_on_spell_id"

  create_table "spell_progressions", force: true do |t|
    t.integer  "adventuring_class_id"
    t.integer  "subclass_id"
    t.integer  "level_progression_id"
    t.integer  "spell_level"
    t.integer  "slots"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spell_progressions", ["adventuring_class_id"], name: "index_spell_progressions_on_adventuring_class_id"
  add_index "spell_progressions", ["level_progression_id"], name: "index_spell_progressions_on_level_progression_id"
  add_index "spell_progressions", ["subclass_id"], name: "index_spell_progressions_on_subclass_id"

  create_table "spell_ranges", force: true do |t|
    t.integer  "spell_id"
    t.integer  "range_type_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spell_ranges", ["range_type_id"], name: "index_spell_ranges_on_range_type_id"
  add_index "spell_ranges", ["spell_id"], name: "index_spell_ranges_on_spell_id"

  create_table "spell_tags", force: true do |t|
    t.integer  "spell_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spell_tags", ["spell_id"], name: "index_spell_tags_on_spell_id"
  add_index "spell_tags", ["tag_id"], name: "index_spell_tags_on_tag_id"

  create_table "spells", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "magic_school_id"
    t.boolean  "is_verbal"
    t.boolean  "is_somatic"
    t.boolean  "is_concentration"
    t.boolean  "is_ritual"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spells", ["magic_school_id"], name: "index_spells_on_magic_school_id"

  create_table "subclasses", force: true do |t|
    t.integer  "adventuring_class_id"
    t.string   "name"
    t.text     "description"
    t.integer  "min_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subclasses", ["adventuring_class_id"], name: "index_subclasses_on_adventuring_class_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_increments", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weapons", force: true do |t|
    t.string   "name"
    t.integer  "damage_die"
    t.integer  "die_count"
    t.integer  "range"
    t.integer  "damage_type_id"
    t.integer  "item_id"
    t.integer  "ability_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "disadvantage_range"
  end

  add_index "weapons", ["ability_id"], name: "index_weapons_on_ability_id"
  add_index "weapons", ["damage_type_id"], name: "index_weapons_on_damage_type_id"
  add_index "weapons", ["item_id"], name: "index_weapons_on_item_id"

end
