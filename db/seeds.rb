# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all

@user_1 = User.create!(name: "Angel Byun", email: "angelbyun@turing.edu")
@user_2 = User.create!(name: "Isaac Thill", email: "isaacthill@turing.edu")
@user_3 = User.create!(name: "Scott Le", email: "scottle@gmail.com")
@user_4 = User.create!(name: "Megan Hinricher", email: "hinmeg@gmail.com")