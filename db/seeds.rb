# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@user_1 = User.create!(name: "Joe Smith", email: "joey_smithy@yahooey.com")
@user_2 = User.create!(name: "Sam Smith", email: "sam_smithy@yahooey.com")

@viewing_party_1 = ViewingParty.create!(duration_of_party: 300, when: "2023-12-25", start_time: "10:10")
@viewing_party_2 = ViewingParty.create!(duration_of_party: 280, when: "2439-10-31", start_time: "11:48")

@user_1.viewing_party_users.create!(viewing_party: @viewing_party_1, is_host: false)
@user_1.viewing_party_users.create!(viewing_party: @viewing_party_2, is_host: true)