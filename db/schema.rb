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

ActiveRecord::Schema.define(version: 2021_03_22_145817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movie_dates", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active", default: true
    t.text "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "seat_id"
    t.bigint "show_time_id"
    t.bigint "user_id"
    t.boolean "reserved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seat_id"], name: "index_reservations_on_seat_id"
    t.index ["show_time_id"], name: "index_reservations_on_show_time_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screens", force: :cascade do |t|
    t.string "name"
    t.integer "floor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screens_seats", force: :cascade do |t|
    t.bigint "seat_id"
    t.bigint "screen_id"
    t.integer "price"
    t.index ["screen_id"], name: "index_screens_seats_on_screen_id"
    t.index ["seat_id"], name: "index_screens_seats_on_seat_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "show_times", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "screen_id"
    t.bigint "slot_id"
    t.bigint "movie_date_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_date_id"], name: "index_show_times_on_movie_date_id"
    t.index ["movie_id"], name: "index_show_times_on_movie_id"
    t.index ["screen_id"], name: "index_show_times_on_screen_id"
    t.index ["slot_id"], name: "index_show_times_on_slot_id"
  end

  create_table "slots", force: :cascade do |t|
    t.string "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "reservations", "seats"
  add_foreign_key "reservations", "show_times"
  add_foreign_key "reservations", "users"
end
