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

ActiveRecord::Schema.define(version: 2020_02_23_075100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "act_urls", force: :cascade do |t|
    t.integer "act_id"
    t.integer "band_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "acts", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "live_id"
    t.index ["live_id"], name: "index_acts_on_live_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.integer "prefecture", default: 0, null: false
    t.string "avatar"
    t.index ["email"], name: "index_bands_on_email", unique: true
    t.index ["reset_password_token"], name: "index_bands_on_reset_password_token", unique: true
  end

  create_table "follow_bands", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "band_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_follow_bands_on_band_id"
    t.index ["user_id", "band_id"], name: "index_follow_bands_on_user_id_and_band_id", unique: true
    t.index ["user_id"], name: "index_follow_bands_on_user_id"
  end

  create_table "going_to_lives", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "live_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["live_id"], name: "index_going_to_lives_on_live_id"
    t.index ["user_id"], name: "index_going_to_lives_on_user_id"
  end

  create_table "live_houses", force: :cascade do |t|
    t.string "name", null: false
    t.string "tel", null: false
    t.integer "prefecture", default: 0, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_live_houses_on_email", unique: true
    t.index ["reset_password_token"], name: "index_live_houses_on_reset_password_token", unique: true
  end

  create_table "lives", force: :cascade do |t|
    t.string "title", null: false
    t.date "date", null: false
    t.time "open_time"
    t.time "start_time"
    t.time "end_time"
    t.integer "early_bird_ticket_price", null: false
    t.integer "tickets_for_today_price", null: false
    t.string "image"
    t.string "time_table_image"
    t.text "remarks"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "band_id"
    t.index ["band_id"], name: "index_lives_on_band_id"
  end

  create_table "place_urls", force: :cascade do |t|
    t.integer "place_id"
    t.integer "live_house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "live_id"
    t.index ["live_id"], name: "index_places_on_live_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "ticket_name", null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "acts", "lives", column: "live_id"
  add_foreign_key "follow_bands", "bands"
  add_foreign_key "follow_bands", "users"
  add_foreign_key "going_to_lives", "lives", column: "live_id"
  add_foreign_key "going_to_lives", "users"
  add_foreign_key "lives", "bands"
  add_foreign_key "places", "lives", column: "live_id"
end
