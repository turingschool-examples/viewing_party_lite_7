# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user_1 = User.create!(name: "Ringo", email: "ringo@gmail.com")
user_2 = User.create!(name: "Paul", email: "paul@gmail.com")
user_3 = User.create!(name: "George", email: "george@gmail.com")
user_4 = User.create!(name: "John", email: "john@gmail.com")
user_5 = User.create!(name: "Yoko", email: "yoko@gmail.com")

