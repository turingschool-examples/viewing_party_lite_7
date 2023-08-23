def load_test_data
  @user1 = User.create(name: 'user1', email: 'user1@turing.edu')
  @user2 = User.create(name: 'user2', email: 'user2@turing.edu')
  @user3_duplicate_email = User.create(name: 'user3', email: 'user2@turing.edu')
end
