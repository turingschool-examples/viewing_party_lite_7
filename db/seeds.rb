# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
ViewingParty.destroy_all


user1 = User.create!(name: "Flick Chick", email: "flick@yahoo.com")
user2 = User.create!(name: "Rom Com Ron", email: "comron@yahoo.com")
user3 = User.create!(name: "Action Jackson", email: "itsjack@aol.com")

vp1 = ViewingParty.create!(duration: 90, date: "08-01-2023", start_time: "8 PM")
vp2 = ViewingParty.create!(duration: 130, date: "09-03-2023", start_time: "4 PM")

UserViewingParty.create!(user: user3, viewing_party: vp1)
UserViewingParty.create!(user: user3, viewing_party: vp2)