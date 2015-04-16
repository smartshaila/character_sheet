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

ActiveRecord::Schema.define(version: 20150416011549) do

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
  end

  add_index "characters", ["adventuring_class_id"], name: "index_characters_on_adventuring_class_id"

  create_table "class_proficiencies", force: true do |t|
    t.integer  "adventuring_class_id"
    t.integer  "ability_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "class_proficiencies", ["ability_id"], name: "index_class_proficiencies_on_ability_id"
  add_index "class_proficiencies", ["adventuring_class_id"], name: "index_class_proficiencies_on_adventuring_class_id"

  create_table "damage_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "level_progressions", force: true do |t|
    t.integer  "level"
    t.integer  "proficiency"
    t.integer  "min_xp"
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

  create_table "skills", force: true do |t|
    t.string   "name"
    t.integer  "ability_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["ability_id"], name: "index_skills_on_ability_id"

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
  end

  add_index "weapons", ["ability_id"], name: "index_weapons_on_ability_id"
  add_index "weapons", ["damage_type_id"], name: "index_weapons_on_damage_type_id"
  add_index "weapons", ["item_id"], name: "index_weapons_on_item_id"

end
