ActiveRecord::Schema[7.0].define(version: 2023_11_28_003643) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.float "vote_average"
    t.integer "runtime"
    t.string "genre"
    t.string "description"
    t.string "cast_members"
    t.string "review_count"
    t.string "review_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_viewing_parties", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "viewing_party_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_viewing_parties_on_user_id"
    t.index ["viewing_party_id"], name: "index_user_viewing_parties_on_viewing_party_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "viewing_parties", force: :cascade do |t|
    t.string "host_id"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "movie_id", null: false
    t.index ["movie_id"], name: "index_viewing_parties_on_movie_id"
  end

  add_foreign_key "user_viewing_parties", "users"
  add_foreign_key "user_viewing_parties", "viewing_parties"
  add_foreign_key "viewing_parties", "movies"
end
