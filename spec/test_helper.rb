def load_test_data
  @anne = User.create!(name: "Anne Anderson", email: "anne.anderson@aol.com")
  @blair = User.create!(name: "Blair Busch", email: "Blair@aol.com")
  @cindy = User.create!(name: "Cindy Conners", email: "CC@aol.com")
end