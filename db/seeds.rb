# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'factory_bot_rails'

@user1 = FactoryBot.create(:user)
@user2 = FactoryBot.create(:user)
@user3 = FactoryBot.create(:user)
@user4 = FactoryBot.create(:user)
@user = User.create!(email: "email@email.com", name: "Email", password: "secretpassword")
@view_party1 = ViewingParty.create!(duration: 300, date_time: Date.today, api_movie_id: 11528)
@view_user1 = ViewingUser.create!(user_id: @user1.id, viewing_party_id: @view_party1.id, host: 1)