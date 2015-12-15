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

ActiveRecord::Schema.define(version: 20151215113754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.string   "list"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "place_id"
    t.integer  "user_id"
  end

  add_index "bookmarks", ["place_id"], name: "index_bookmarks_on_place_id", using: :btree
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_places", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "place_id",    null: false
  end

  add_index "categories_places", ["category_id"], name: "index_categories_places_on_category_id", using: :btree
  add_index "categories_places", ["place_id"], name: "index_categories_places_on_place_id", using: :btree

  create_table "months", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "months_places", id: false, force: :cascade do |t|
    t.integer "month_id", null: false
    t.integer "place_id", null: false
  end

  add_index "months_places", ["month_id"], name: "index_months_places_on_month_id", using: :btree
  add_index "months_places", ["place_id"], name: "index_months_places_on_place_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "continent"
    t.text     "avg_temps",                array: true
    t.text     "avg_precips",              array: true
    t.text     "desc1"
    t.text     "desc2"
    t.text     "photo_main"
    t.text     "desc3"
    t.text     "best_time"
    t.string   "month_names"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  add_foreign_key "bookmarks", "places"
  add_foreign_key "bookmarks", "users"
end
