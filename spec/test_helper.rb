def load_test_data
  @user1 = User.create!(name: "Tom", email: "Tom@a_website.com", password: 'password123', password_confirmation: 'password123')
  @user2 = User.create!(name: "Jerry", email: "Jerry@a_website.com", password: 'password123', password_confirmation: 'password123')
  @user3 = User.create!(name: "Bob", email: "Bob@a_website.com", password: 'password123', password_confirmation: 'password123')  

  @party1 = @user1.parties.create!(movie_id: 11, movie_title: "Star Wars", duration: 120, date: '2023/08/01', start_time: '10:00')
  @party2 = @user2.parties.create!(movie_id: 120, movie_title: "LOTR", duration: 180, date: '2023/09/01', start_time: '11:00')

  @user_party1 = @user1.user_parties.create!(party_id: @party1.id, is_host: true)
  @user_party2 = @user2.user_parties.create!(party_id: @party1.id)
  @user_party3 = @user3.user_parties.create!(party_id: @party1.id)
  @user_party4 = @user2.user_parties.create!(party_id: @party2.id, is_host: true)
  @user_party5 = @user1.user_parties.create!(party_id: @party2.id)
  @user_party6 = @user3.user_parties.create!(party_id: @party2.id)

end

def accept_invite(user, party)
  page.driver.submit :patch, "/users/#{user.id}/viewing-parties/#{party.id}/accept_invite", {}
end