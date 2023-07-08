# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require "factory_bot_rails"

# User.destroy_all
# WatchParty.destroy_all
# MovieWatchParty.destroy_all

# movie_1_attrs = {
#   title: "Ant-Man and the Wasp: Quantumania",
#   length: 120,
#   rating: 85,
#   id: 52345
# }

# movie_2_attrs = {
#   title: "Endless Summer",
#   length: 100,
#   rating: 60,
#   id: 45352

# }

# movie_3_attrs = {
#   title: "Hanna",
#   length: 80,
#   rating: 95,
#   id: 34233
# }

# @movie_1 = Movie.new(movie_1_attrs)
# @movie_2 = Movie.new(movie_2_attrs)
# @movie_3 = Movie.new(movie_3_attrs)

# user_1 = User.create!(name: "Ricky", email: "Email@email.com")
# user_2 = User.create!(name: "Bobby", email: "Email2@email.com")
# user_3 = User.create!(name: "joey", email: "Email3@email.com")

# # user_2 = FactoryBot.create(:user)
# # user_3 = FactoryBot.create(:user)

# wapa_1 = WatchParty.create!(date: "7/7/2023", duration: 123, start_time: "8:45" movie_title: @movie_1.title)
# wapa_2 = WatchParty.create!(date: "8/7/2023", duration: 143, start_time: "7:45" movie_title: @movie_2.title)
# wapa_3 = WatchParty.create!(date: "9/7/2023", duration: 223, start_time: "6:45" movie_title: @movie_3.title)

# # wapa_1 = FactoryBot.create(:watch_party, movie_title: @movie_1.title)
# # wapa_2 = FactoryBot.create(:watch_party, movie_title: @movie_2.title)
# # wapa_3 = FactoryBot.create(:watch_party, movie_title: @movie_2.title)

# movie_watch_party_1 = FactoryBot.create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_1.id)
# movie_watch_party_2 = FactoryBot.create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_2.id)
# movie_watch_party_3 = FactoryBot.create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_3.id)

# movie_watch_party_4 = FactoryBot.create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_1.id)
# movie_watch_party_5 = FactoryBot.create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_2.id)
# movie_watch_party_6 = FactoryBot.create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_3.id)