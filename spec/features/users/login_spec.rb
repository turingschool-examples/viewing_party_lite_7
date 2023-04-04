require 'rails_helper'

RSpec.describe "Logging In" do
  let!(:user) { User.create(name: "Pete", email: "pete@email.com", password: "password") }
  context "As a visitor" do
    it "can log in with valid credentials" do
      visit root_path
      
      click_on "I already have an account"
      
      expect(current_path).to eq(login_path)

      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on "Log In"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome, #{user.name}!")
    end

    it "cannot log in if credentials are not filled in" do
      visit root_path
      
      click_on "I already have an account"
      
      expect(current_path).to eq(login_path)

      click_on "Log In"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid Credentials")
    end
  end
end