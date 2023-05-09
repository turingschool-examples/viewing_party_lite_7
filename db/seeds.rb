# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@user_1 = User.create!(name: 'John Doe', email: 'johndoe@yahoo.com')
@user_2 = User.create!(name: 'Alex Smith', email: 'Asmith@yahoo.com')
@user_3 = User.create!(name: 'Elvis Presley', email: 'kingofrock@yahoo.com')

@viewing_party_1 = ViewingParty.create!(movie_id: 100, duration: 175, date: '2021-08-01', start_time: '2021-08-01 19:00:00 UTC', user_id: @user_1.id)
@viewing_party_2 = ViewingParty.create!(movie_id: 202, duration: 145, date: '2020-06-11', start_time: '2021-06-011 14:00:00 UTC', user_id: @user_2.id)

@viewing_party_user_1 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_1.id)
@viewing_party_user_2 = ViewingPartyUser.create!(user_id: @user_2.id, viewing_party_id: @viewing_party_1.id)
@viewing_party_user_3 = ViewingPartyUser.create!(user_id: @user_3.id, viewing_party_id: @viewing_party_1.id)
@viewing_party_user_3 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_2.id)