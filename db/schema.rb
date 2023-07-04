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

ActiveRecord::Schema[7.0].define(version: 2023_07_04_152850) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movie_watch_parties", force: :cascade do |t|
    t.bigint "watch_parties_id", null: false
    t.bigint "movies_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movies_id"], name: "index_movie_watch_parties_on_movies_id"
    t.index ["users_id"], name: "index_movie_watch_parties_on_users_id"
    t.index ["watch_parties_id"], name: "index_movie_watch_parties_on_watch_parties_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "duration"
    t.integer "rating"
    t.string "genre"
    t.string "summary"
    t.string "cast"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "watch_parties", force: :cascade do |t|
    t.string "date"
    t.integer "duration"
    t.string "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "movie_watch_parties", "movies", column: "movies_id"
  add_foreign_key "movie_watch_parties", "users", column: "users_id"
  add_foreign_key "movie_watch_parties", "watch_parties", column: "watch_parties_id"
end
