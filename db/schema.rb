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

ActiveRecord::Schema.define(version: 20161110094715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "twitter_handle"
    t.integer  "twitter_follower_count"
    t.string   "website"
    t.string   "profile_banner_uri"
    t.string   "profile_image_uri"
    t.boolean  "trainings",              default: false, null: false
  end

  create_table "companies_technologies", id: false, force: :cascade do |t|
    t.integer "company_id",    null: false
    t.integer "technology_id", null: false
    t.index ["company_id", "technology_id"], name: "index_companies_technologies_on_company_id_and_technology_id", using: :btree
    t.index ["technology_id", "company_id"], name: "index_companies_technologies_on_technology_id_and_company_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
  end

  create_table "offices", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["company_id"], name: "index_offices_on_company_id", using: :btree
    t.index ["location_id"], name: "index_offices_on_location_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string  "github_username"
    t.integer "user_id"
  end

  create_table "profiles_technologies", id: false, force: :cascade do |t|
    t.integer "profile_id",    null: false
    t.integer "technology_id", null: false
    t.index ["profile_id", "technology_id"], name: "index_profiles_technologies_on_profile_id_and_technology_id", using: :btree
    t.index ["technology_id", "profile_id"], name: "index_profiles_technologies_on_technology_id_and_profile_id", using: :btree
  end

  create_table "technologies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "admin",              default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "email_confirmed",    default: false
    t.string   "confirmation_token"
  end

  add_foreign_key "offices", "companies"
  add_foreign_key "offices", "locations"
end
