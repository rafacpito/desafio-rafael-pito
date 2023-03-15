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

ActiveRecord::Schema.define(version: 2023_03_14_022922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street", null: false
    t.string "complement"
    t.string "neighborhood", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "postal_code", null: false
    t.string "ibge_code"
    t.bigint "citizen_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["citizen_id"], name: "index_addresses_on_citizen_id"
  end

  create_table "citizens", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "photo", null: false
    t.date "birth_date", null: false
    t.string "telephone", null: false
    t.string "cpf", null: false
    t.string "cns", null: false
    t.string "email", null: false
    t.boolean "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "citizens"
end
