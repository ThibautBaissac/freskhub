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

ActiveRecord::Schema[7.1].define(version: 2024_07_05_092417) do
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

end
