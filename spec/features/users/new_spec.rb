require "rails_helper"

RSpec.describe "User registration page", type: :feature do
  describe "when I visit the registration page" do
    it "displays a form to create a new user" do
      visit "/register"

      expect(page).to have_content("Register a New User")
      expect(page).to have_field("User name")
      expect(page).to have_field("Email")
      expect(page).to have_button("Create New User")
    end

    it "allows me to fill in the form and get redirected to the user show page that was created" do
      visit "/register"

      fill_in "User name", with: "Steve Test"
      fill_in "Email", with: "Steve@test.com"
      fill_in "Password:", with: "test"
      fill_in "Password Confirmation", with: "test"
      click_button "Create New User"

      expect(current_path).to eq(dashboard_path)
    end

    it "displays an error message if email is already in use" do
      test_user = User.create!(user_name: "Steve", email: "test@email.com", password: 'password123', password_confirmation: 'password123')
      visit "/register"
      fill_in "User name", with: "Kate Test"
      fill_in "Email", with: "test@email.com"
      fill_in "Password:", with: "test"
      fill_in "Password Confirmation", with: "test"


      click_button "Create New User"
      expect(page).to have_content("Email has already been taken")
    end
  end
end