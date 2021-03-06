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

ActiveRecord::Schema.define(version: 20161224202912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street",      null: false
    t.string   "city",        null: false
    t.string   "state",       null: false
    t.string   "zip_code",    null: false
    t.integer  "district_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["district_id"], name: "index_addresses_on_district_id", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "zip_code",     null: false
    t.string   "rep_name"
    t.string   "rep_district"
    t.string   "rep_phone"
    t.string   "rep_link"
    t.string   "sen1_name"
    t.string   "sen1_seat"
    t.string   "sen1_phone"
    t.string   "sen1_link"
    t.string   "sen2_name"
    t.string   "sen2_seat"
    t.string   "sen2_phone"
    t.string   "sen2_link"
    t.string   "rep_state"
  end

end
