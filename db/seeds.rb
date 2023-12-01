# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

@user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
@user2 = User.create!(name: 'Mama', email: 'mama@gmail.com')

#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
