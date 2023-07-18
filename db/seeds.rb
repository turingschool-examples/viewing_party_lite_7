# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(name: 'John Johnson', email: 'j@j.com', password: 'j', password_confirmation: 'j')
User.create!(name: 'Emily Emmson', email: 'e@e.com', password: 'e', password_confirmation: 'e')
User.create!(name: 'Tom Thompson', email: 't@t.com', password: 't', password_confirmation: 't')
User.create!(name: 'Bob Bobson', email: 'b@b.com', password: 'b', password_confirmation: 'b')
