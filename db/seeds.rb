# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@user1 = User.create(name: "CandyLand", email: "Bungie123@gmail.com")
@user2 = User.create(name: "Macbeth", email: "Blurp@gmail.com")
@user3 = User.create(name: "Jerry", email: "Moogoo@gmail.com")

@movie1 = Movie.create(title: "The Lion Bling", runtime: 150)
@movie2 = Movie.create(title: "Leroy Jenkins", runtime: 90)
@movie3 = Movie.create(title: "Why Your Mom Moved Out", runtime: 220)

@party1 = Party.create(duration: 200, name: "The Lion Bling Watch Party", date: "1/22/2024", start_time: 1800, movie_id: @movie1.id)
@party2 = Party.create(duration: 100, name: "Leroy Jenkins Watch Party", date: "10/2/1999", start_time: 1400, movie_id: @movie2.id)
@party3 = Party.create(duration: 250, name: "Why Your Mom Moved Out Watch Party", date: "7/15/2008", start_time: 1900, movie_id: @movie3.id)

@userparty1 = UserParty.create(user_id: @user1.id, party_id: @party1.id, creator: true)
@userparty2 = UserParty.create(user_id: @user2.id, party_id: @party1.id, creator: false)
