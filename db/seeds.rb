# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@user_1 = User.create!(name: "User 1", email: "email1@email.com")
@user_2 = User.create!(name: "User 2", email: "email2@email.com")
@user_3 = User.create!(name: "User 3", email: "email3@email.com")
@user_4 = User.create!(name: "User 4", email: "email4@email.com")
@user_5 = User.create!(name: "User 5", email: "email5@email.com")

@party_1 = Party.create!(duration: 135, date: "05/09/2023", time: "12:00")

@party_1.user_parties.create!(user_id: @user_2.id)
