# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "factory_bot_rails"

User.destroy_all
Movie.destroy_all
WatchParty.destroy_all
MovieWatchParty.destroy_all

user_1 = User.create!(name: "Ricky", email: "Email@email.com")

user_2 = FactoryBot.create(:user)
user_3 = FactoryBot.create(:user)

movie_1 = FactoryBot.create(:movie)
movie_2 = FactoryBot.create(:movie)
movie_3 = FactoryBot.create(:movie)

wapa_1 = FactoryBot.create(:watch_party, movie_id: movie_1.id)
wapa_2 = FactoryBot.create(:watch_party, movie_id: movie_2.id)
wapa_3 = FactoryBot.create(:watch_party, movie_id: movie_3.id)

movie_watch_party_1 = FactoryBot.create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_1.id)
movie_watch_party_2 = FactoryBot.create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_2.id)
movie_watch_party_3 = FactoryBot.create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_3.id)

movie_watch_party_4 = FactoryBot.create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_1.id)
movie_watch_party_5 = FactoryBot.create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_2.id)
movie_watch_party_6 = FactoryBot.create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_3.id)
