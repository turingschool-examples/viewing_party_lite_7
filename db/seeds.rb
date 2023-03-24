# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create!(name: 'Bob', email: 'bob@bob')
user2 = User.create!(name: 'Job', email: 'job@bob')
user3 = User.create!(name: 'Larry', email: 'lob@job')
user4 = User.create!(name: 'Jimbo', email: 'Jimbo@lob')
