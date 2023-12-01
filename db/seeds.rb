# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@user_1 = User.create!(name: 'Kiwi', email: 'kiwibird@gmail.com')
@user_2 = User.create!(name: 'Pam', email: 'pam@email.com')
@user_3 = User.create!(name: 'Lana', email: 'lana@email.com')
@user_4 = User.create!(name: 'Archer', email: 'archer@email.com')
@party_1 = Party.create!(movie_id: 438631, duration_of_party: 109, party_date: '2024-10-10', start_time: '07:23')
@party_2 = Party.create!(movie_id: 438631, duration_of_party: 109, party_date: '2024-10-11', start_time: '09:23')
@party_3 = Party.create!(movie_id: 438631, duration_of_party: 109, party_date: '2024-10-12', start_time: '13:09')
@party_4 = Party.create!(movie_id: 438631, duration_of_party: 109, party_date: '2024-10-13', start_time: '15:09')
PartyUser.create!(user_id: @user_1.id, party_id: @party_1.id, is_host: true)
PartyUser.create!(user_id: @user_2.id, party_id: @party_1.id, is_host: false)
PartyUser.create!(user_id: @user_1.id, party_id: @party_2.id, is_host: false)
PartyUser.create!(user_id: @user_2.id, party_id: @party_2.id, is_host: true)
PartyUser.create!(user_id: @user_1.id, party_id: @party_3.id, is_host: false)
PartyUser.create!(user_id: @user_2.id, party_id: @party_3.id, is_host: true)