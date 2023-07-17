require "rails_helper"

RSpec.describe "User Registration Page" do
  describe "Register new User" do
    it "Sees form for a new user" do
      visit "/"
      click_button "Create New User"
      expect(current_path).to eq users_register_index_path
      expect(page).to have_field("email")
      expect(page).to have_field("name")
      expect(page).to have_field("password")
      expect(page).to have_field("password_confirmation")
      expect(page).to have_button("Register")
      fill_in :name, with: "Email"
      fill_in :email, with: "email@email.com"
      fill_in :password, with: "secretpassword"
      fill_in :password_confirmation, with: "secretpassword"
      click_button "Register"
      user = User.last
      expect(current_path).to eq user_path(user.id)
    end
  end
end