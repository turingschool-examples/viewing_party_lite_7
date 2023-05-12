# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@user_1 = User.create!(name: 'Nikola Jokic', email: 'joker@yahoo.com')
@user_2 = User.create!(name: 'Jamal Murray', email: 'JMurray@yahoo.com')
@user_3 = User.create!(name: 'Anthony Davis', email: 'thebrow@yahoo.com')
@user_4 = User.create!(name: 'LeBron James', email: 'kidfromakron@gmail.com')
@user_5 = User.create!(name: 'Devin Booker', email: 'dbook@gmail.com')
@user_6 = User.create!(name: 'Kevin Durant', email: 'durantula@gmail.com')


