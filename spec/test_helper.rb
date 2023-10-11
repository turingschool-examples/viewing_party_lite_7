def load_test_data
  @user1 = User.create!(name: "Tom", email: "Tom@a_website.com")
  @user2 = User.create!(name: "Jerry", email: "Jerry@a_website.com")
  @user3 = User.create!(name: "Bob", email: "Bob@a_website.com")  

  @party1 = @user1.parties.create!(name: "Stars Wars watch Party")
  @party2 = @user1.parties.create!(name: "LOTR Wars watch Party") 
end