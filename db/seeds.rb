# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
UserViewingParty.destroy_all
ViewingParty.destroy_all
User.destroy_all
@user1 = User.create!(name: "Maggie", email: "maggie@gmail.com")
  @user2 = User.create!(name: "Max", email: "max@gmail.com")
  @user3 = User.create!(name: "Wolfie", email: "wolfie@gmail.com")
  @user4 = User.create!(name: "Ink Jet Printer", email: "inkjet@gmail.com")
  @viewing_party1 = ViewingParty.create!(day: "2023-07-01", start_time: "04:00 PM", movie_id: 1, duration: "120 minutes", movie_title: "Speed")
  @viewing_party2 = ViewingParty.create!(day: "2023-07-02", start_time: "05:00 PM", movie_id: 2, duration: "125 minutes", movie_title: "Spirited Away")
  @viewing_party3 = ViewingParty.create!(day: "2023-07-03", start_time: "04:30 PM", movie_id: 3, duration: "130 minutes", movie_title: "Up")

  @viewing_party4 = ViewingParty.create!(day: "2023-07-05", start_time: "06:00 PM", movie_id: 4, duration: "140 minutes", movie_title: "Wolfie finds a bone!")
  @viewing_party5 = ViewingParty.create!(day: "2023-07-08", start_time: "06:45 PM", movie_id: 5, duration: "144 minutes", movie_title: "Jaws")
  
  @userparty1 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @viewing_party1.id, host: true)
  @userparty2 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @viewing_party2.id, host: true)
  @userparty3 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @viewing_party3.id, host: true)
  
  @userparty4 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @viewing_party4.id, host: false)
  @userparty5 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @viewing_party5.id, host: false)
  @userparty6 = UserViewingParty.create!(user_id: @user2.id, viewing_party_id: @viewing_party5.id, host: false)
  @userparty7 = UserViewingParty.create!(user_id: @user3.id, viewing_party_id: @viewing_party5.id, host: false)
  @userparty8 = UserViewingParty.create!(user_id: @user4.id, viewing_party_id: @viewing_party5.id, host: true)
