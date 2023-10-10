# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user_1 = User.create!(name: "Jamie", email: "34@gmail.com")
user_2 = User.create!(name: "Katie", email: "34997@gmail.com")
viewing_party_1 = ViewingParty.create!(duration: 180, date: 05/14/2023, start_time: "07:00:00", movie_id: 3)
user_party = UserViewingParty.create!(user: user_1, viewing_party: viewing_party_1)
user_party = UserViewingParty.create!(user: user_2, viewing_party: viewing_party_1)
