# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@user_1 = User.create!(name: "Katie", email: "email_address@gmail.com")
@user_2 = User.create!(name: "Steve", email: "email_address_2@gmail.com")
@user_3 = User.create!(name: "Stacey", email: "email_address_3@gmail.com")