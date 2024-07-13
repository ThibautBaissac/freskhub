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

ActiveRecord::Schema[7.1].define(version: 2024_07_08_194914) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billing_coupons", force: :cascade do |t|
    t.string "code", null: false
    t.string "description"
    t.integer "current_redemption", default: 0, null: false
    t.integer "max_redemption", default: 1, null: false
    t.datetime "end_date"
    t.bigint "fresk_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_billing_coupons_on_code", unique: true
    t.index ["fresk_id"], name: "index_billing_coupons_on_fresk_id"
  end

  create_table "billing_orders", force: :cascade do |t|
    t.integer "tax_rate", null: false
    t.integer "after_tax_price_cents", null: false
    t.integer "tax_cents", null: false
    t.integer "before_tax_price_cents", null: false
    t.string "currency", null: false
    t.string "status", null: false
    t.bigint "billing_product_id", null: false
    t.bigint "participant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billing_product_id"], name: "index_billing_orders_on_billing_product_id"
    t.index ["participant_id"], name: "index_billing_orders_on_participant_id"
  end

  create_table "billing_products", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "tax_rate", null: false
    t.integer "after_tax_price_cents", null: false
    t.integer "tax_cents", null: false
    t.integer "before_tax_price_cents", null: false
    t.string "currency", default: "EUR", null: false
    t.bigint "country_id", null: false
    t.bigint "fresk_id", null: false
    t.bigint "training_session_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_billing_products_on_country_id"
    t.index ["fresk_id"], name: "index_billing_products_on_fresk_id"
    t.index ["training_session_category_id"], name: "index_billing_products_on_training_session_category_id"
  end

  create_table "billing_session_products", force: :cascade do |t|
    t.bigint "billing_product_id", null: false
    t.bigint "training_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billing_product_id", "training_session_id"], name: "index_billing_session_products_on_billing_product_id_and_ts_id", unique: true
    t.index ["billing_product_id"], name: "index_billing_session_products_on_billing_product_id"
    t.index ["training_session_id"], name: "index_billing_session_products_on_training_session_id"
  end

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

  create_table "fresks", force: :cascade do |t|
    t.string "name", null: false
    t.string "identifier", null: false
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "training_session_attendances", force: :cascade do |t|
    t.bigint "facilitator_id", null: false
    t.bigint "participant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitator_id"], name: "index_training_session_attendances_on_facilitator_id"
    t.index ["participant_id"], name: "index_training_session_attendances_on_participant_id"
  end

  create_table "training_session_categories", force: :cascade do |t|
    t.bigint "fresk_id", null: false
    t.string "identifier", null: false
    t.string "format", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fresk_id"], name: "index_training_session_categories_on_fresk_id"
    t.index ["identifier"], name: "index_training_session_categories_on_identifier", unique: true
  end

  create_table "training_session_editors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "training_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_session_id"], name: "index_training_session_editors_on_training_session_id"
    t.index ["user_id"], name: "index_training_session_editors_on_user_id"
  end

  create_table "training_session_roles", force: :cascade do |t|
    t.string "type", null: false
    t.string "status", null: false
    t.integer "anonymous_count", default: 0, null: false
    t.bigint "training_session_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "coupon_id"
    t.index ["coupon_id"], name: "index_training_session_roles_on_coupon_id"
    t.index ["training_session_id"], name: "index_training_session_roles_on_training_session_id"
    t.index ["type"], name: "index_training_session_roles_on_type"
    t.index ["user_id"], name: "index_training_session_roles_on_user_id"
  end

  create_table "training_sessions", force: :cascade do |t|
    t.text "participants_message"
    t.text "facilitators_message"
    t.string "uuid", null: false
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.integer "max_participants", default: 0, null: false
    t.string "connexion_url"
    t.boolean "published"
    t.bigint "language_id", null: false
    t.bigint "country_id", null: false
    t.bigint "training_session_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_training_sessions_on_country_id"
    t.index ["language_id"], name: "index_training_sessions_on_language_id"
    t.index ["training_session_category_id"], name: "index_training_sessions_on_training_session_category_id"
    t.index ["uuid"], name: "index_training_sessions_on_uuid", unique: true
  end

  create_table "translations", force: :cascade do |t|
    t.string "translatable_type", null: false
    t.bigint "translatable_id", null: false
    t.string "language", null: false
    t.string "content", null: false
    t.string "field", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translatable_type", "translatable_id"], name: "index_translations_on_translatable"
  end

  create_table "user_infos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "fresk_id", null: false
    t.string "role", default: "USER", null: false
    t.boolean "facilitator", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fresk_id"], name: "index_user_infos_on_fresk_id"
    t.index ["user_id"], name: "index_user_infos_on_user_id"
  end

  create_table "user_languages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_user_languages_on_language_id"
    t.index ["user_id"], name: "index_user_languages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "firstname"
    t.string "lastname"
    t.text "description"
    t.string "locale", default: "fr", null: false
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

  add_foreign_key "billing_coupons", "fresks"
  add_foreign_key "billing_orders", "billing_products"
  add_foreign_key "billing_orders", "training_session_roles", column: "participant_id"
  add_foreign_key "billing_products", "countries"
  add_foreign_key "billing_products", "fresks"
  add_foreign_key "billing_products", "training_session_categories"
  add_foreign_key "billing_session_products", "billing_products"
  add_foreign_key "billing_session_products", "training_sessions"
  add_foreign_key "training_session_attendances", "training_session_roles", column: "facilitator_id"
  add_foreign_key "training_session_attendances", "training_session_roles", column: "participant_id"
  add_foreign_key "training_session_categories", "fresks"
  add_foreign_key "training_session_editors", "training_sessions"
  add_foreign_key "training_session_editors", "users"
  add_foreign_key "training_session_roles", "billing_coupons", column: "coupon_id"
  add_foreign_key "training_session_roles", "training_sessions"
  add_foreign_key "training_session_roles", "users"
  add_foreign_key "training_sessions", "countries"
  add_foreign_key "training_sessions", "languages"
  add_foreign_key "training_sessions", "training_session_categories"
  add_foreign_key "user_infos", "fresks"
  add_foreign_key "user_infos", "users"
  add_foreign_key "user_languages", "languages"
  add_foreign_key "user_languages", "users"
  add_foreign_key "users", "countries"
end
