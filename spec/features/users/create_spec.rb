require "rails_helper"

RSpec.describe "User Registration Page" do
  describe "Register new User" do
    it "Sees form for a new user" do
      visit "/"
      click_button "Create New User"
      expect(current_path).to eq users_register_index_path
      expect(page).to have_field("email")
      expect(page).to have_field("name")
      expect(page).to have_button("Register")
      fill_in "email", with: "email@email.com"
      fill_in "name", with: "Email"
      click_button "Register"
      # expect(current_path).to eq user_path(@user.id)
      #how do we test user show path
    end
  end
end