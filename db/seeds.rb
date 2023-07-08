# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
UserParty.destroy_all
User.destroy_all
Party.destroy_all

@user1 = User.create!(name: "Cody", email: "code@gmail.com")
@user2 = User.create!(name: "Javen", email: "javenb022@gmail.com")
@user3 = User.create!(name: "Jorge", email: "jorge@gmail.com")
@user4 = User.create!(name: "Sam", email: "sam@gmail.com")

@party1 = Party.create!(movie_id: 155, duration: 120, date: "2023-10-26", start_time: "2023-10-26 12:30:00")
@party2 = Party.create!(movie_id: 15, duration: 130, date: "2023-07-06", start_time: "2023-07-06 18:00:00")
@party3 = Party.create!(movie_id: 3, duration: 115, date: "2023-08-28", start_time: "2023-08-28 19:15:00")

@user_party1 = UserParty.create!(user_id: @user1.id, party_id: @party1.id, is_host: true)
@user_party3 = UserParty.create!(user_id: @user2.id, party_id: @party1.id, is_host: false)

@user_party4 = UserParty.create!(user_id: @user2.id, party_id: @party2.id, is_host: true)
@user_party2 = UserParty.create!(user_id: @user1.id, party_id: @party2.id, is_host: false)
@user_party9 = UserParty.create!(user_id: @user4.id, party_id: @party2.id, is_host: false)

@user_party7 = UserParty.create!(user_id: @user3.id, party_id: @party3.id, is_host: true)
@user_party5 = UserParty.create!(user_id: @user1.id, party_id: @party3.id, is_host: false)
@user_party6 = UserParty.create!(user_id: @user2.id, party_id: @party3.id, is_host: false)
@user_party8 = UserParty.create!(user_id: @user4.id, party_id: @party3.id, is_host: false)