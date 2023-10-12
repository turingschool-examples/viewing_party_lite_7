def load_test_data
  @user1 = User.create!(name: "Tom", email: "Tom@a_website.com")
  @user2 = User.create!(name: "Jerry", email: "Jerry@a_website.com")
  @user3 = User.create!(name: "Bob", email: "Bob@a_website.com")  

  @party1 = @user1.parties.create!(movie_id: 1, movie_title: "Star Wars", duration: 120, date: '2023/08/01', start_time: '10:00')
  @party2 = @user1.parties.create!(movie_id: 2, movie_title: "LOTR", duration: 180, date: '2023/09/01', start_time: '11:00')
end