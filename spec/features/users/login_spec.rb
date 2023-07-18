require 'rails_helper'

RSpec.describe "User Login Form Page" do
  describe "User Login Form" do
    it "page has login information" do
      visit login_path
      expect(page).to have_field "Email"
      expect(page).to have_field "Name"
      expect(page).to have_field "Password"
      expect(page).to have_field "Password confirmation"
      expect(page).to have_button "Login"
    end
    
    it "logs in a user with valid credentials" do
      visit login_path
      fill_in :email, with: "email@email.com"
      fill_in :name, with: "email"
      fill_in :password, with: "secretpassword"
      fill_in :password_confirmation, with: "secretpassword"
      save_and_open_page
      click_button "Login"
      
      user = User.last
      expect(current_path).to eq user_path(user.id)
    end
  end
end