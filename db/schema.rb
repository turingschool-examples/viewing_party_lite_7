ActiveRecord::Schema[7.0].define(version: 2023_04_04_164337) do
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "role", default: 0
  end

  create_table "viewing_parties", force: :cascade do |t|
    t.integer "duration"
    t.date "date"
    t.time "time"
    t.integer "movie_id"
    t.string "movie_title"
    t.string "movie_poster"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "viewing_party_users", force: :cascade do |t|
    t.bigint "viewing_party_id", null: false
    t.bigint "user_id", null: false
    t.boolean "host", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_viewing_party_users_on_user_id"
    t.index ["viewing_party_id"], name: "index_viewing_party_users_on_viewing_party_id"
  end

  add_foreign_key "viewing_party_users", "users"
  add_foreign_key "viewing_party_users", "viewing_parties"
end
