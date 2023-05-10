# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@user1 = User.create!(email: 'jonsmith@gmail.com', name: 'Jon Smith')
@user2 = User.create!(email: 'janedoe@aol.com', name: 'Jane Doe')
@user3 = User.create!(email: 'snoopdogg@gmail.com', name: 'Snoop Dogg')

@viewing_party1 = ViewingParty.create!(movie_id: 11, duration: 120, date: '2023-08-01',
                                       start_time: '2023-08-01 19:00:00 UTC')
@viewing_party2 = ViewingParty.create!(movie_id: 278, duration: 120, date: '2023-09-01',
                                       start_time: '2023-09-01 19:00:00 UTC')
@viewing_party3 = ViewingParty.create!(movie_id: 13, duration: 120, date: '2023-10-01',
                                       start_time: '2023-10-01 19:00:00 UTC')

@user_viewing_party1 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @viewing_party1.id, is_host: false)
@user_viewing_party2 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @viewing_party2.id, is_host: true)
@user_viewing_party3 = UserViewingParty.create!(user_id: @user2.id, viewing_party_id: @viewing_party3.id, is_host: true)
