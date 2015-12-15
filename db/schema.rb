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

ActiveRecord::Schema.define(version: 20151215211929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree
  add_index "categorizations", ["restaurant_id"], name: "index_categorizations_on_restaurant_id", using: :btree

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "restaurant_id"
  end

  add_index "dishes", ["restaurant_id"], name: "index_dishes_on_restaurant_id", using: :btree

  create_table "outings", force: :cascade do |t|
    t.date     "date"
    t.text     "note"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "restaurant_id"
  end

  add_index "outings", ["restaurant_id"], name: "index_outings_on_restaurant_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "website"
    t.string   "image_file_name"
    t.string   "price"
    t.boolean  "fave",            default: false
    t.boolean  "archive",         default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "user_id"
  end

  add_index "restaurants", ["user_id"], name: "index_restaurants_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

  add_foreign_key "categorizations", "categories"
  add_foreign_key "categorizations", "restaurants"
  add_foreign_key "dishes", "restaurants"
  add_foreign_key "outings", "restaurants"
  add_foreign_key "restaurants", "users"
end
