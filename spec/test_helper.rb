def load_test_data
  @user1 = User.create!(name: "Capitainlearyo", email: "example1@yahoo.com")
  @user2 = User.create!(name: "Slick Ric", email: "uhhh@gmail.com")
  @user3 = User.create!(name: "Bob", email: "Bob@a_website.com")
end