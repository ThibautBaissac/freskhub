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

ActiveRecord::Schema[7.1].define(version: 2024_06_14_115301) do
  create_table "documents", force: :cascade do |t|
    t.string "identifier", null: false
    t.string "name", null: false
    t.text "description"
    t.integer "width", default: 100, null: false
    t.integer "height", default: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_documents_on_identifier", unique: true
    t.index ["name"], name: "index_documents_on_name", unique: true
  end

  create_table "languages", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_languages_on_code", unique: true
    t.index ["name"], name: "index_languages_on_name", unique: true
  end

  create_table "page_contents", force: :cascade do |t|
    t.string "content"
    t.string "tolgee_key", null: false
    t.integer "x_pos", default: 0, null: false
    t.integer "y_pos", default: 0, null: false
    t.integer "width", default: 0, null: false
    t.integer "height", default: 0, null: false
    t.integer "document_id", null: false
    t.integer "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_page_contents_on_document_id"
    t.index ["language_id"], name: "index_page_contents_on_language_id"
    t.index ["tolgee_key"], name: "index_page_contents_on_tolgee_key", unique: true
  end

  add_foreign_key "page_contents", "documents"
  add_foreign_key "page_contents", "languages"
end
