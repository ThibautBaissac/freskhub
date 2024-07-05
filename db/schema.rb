# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_05_095228) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "alpha2_code"
    t.string "alpha3_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alpha2_code"], name: "index_countries_on_alpha2_code", unique: true
    t.index ["alpha3_code"], name: "index_countries_on_alpha3_code", unique: true
    t.index ["name"], name: "index_countries_on_name", unique: true
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "set1_code"
    t.string "set2_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_languages_on_name", unique: true
    t.index ["set1_code"], name: "index_languages_on_set1_code", unique: true
    t.index ["set2_code"], name: "index_languages_on_set2_code", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "email", null: false
    t.string "firstname"
    t.string "lastname"
    t.text "description"
    t.string "ui_language", default: "fr", null: false
    t.datetime "last_login_at"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["firstname"], name: "index_users_on_firstname"
    t.index ["lastname"], name: "index_users_on_lastname"
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  add_foreign_key "users", "countries"
end
