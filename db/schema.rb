# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_08_195252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "entity_id", null: false
    t.float "amount"
    t.datetime "date"
    t.string "category"
    t.boolean "recurring"
    t.string "schedule"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "plaid_id"
    t.string "name"
    t.integer "account_id"
    t.string "iso_currency_code"
    t.boolean "donation"
    t.index ["entity_id"], name: "index_expenses_on_entity_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "resource_orgs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "website"
    t.string "image"
    t.string "category"
    t.string "donate"
    t.string "location"
    t.string "scope"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end


  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "expenses", "entities"
  add_foreign_key "expenses", "users"
end
