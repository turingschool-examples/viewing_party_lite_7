# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Users.destroy_all
Parties.destroy_all
UserParties.destroy_all


@user1 = User.create!(name: 'Sarah', email: 'Sarah@gmail.com')
@user2 = User.create!(name: 'Jimmy', email: 'Jimmy@gmail.com')
@user3 = User.create!(name: 'Alex', email: 'Alex@gmail.com')
@user4 = User.create!(name: 'John', email: 'John@gmail.com')
