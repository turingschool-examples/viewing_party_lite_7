require 'rails_helper'

RSpec.describe 'Register Page', type: :feature do
  describe "As a visitor when I visit '/register'" do
    it "I should see a form to register as a new user" do
      visit register_path

      expect(page).to have_content("Register as a New User")
      expect(page).to have_content("Name:")
      expect(page).to have_content("Email:")
      expect(page).to have_button("Register")
      
      fill_in "Name:", with: "Wayne"
      fill_in "Email:", with: "partytime@gmail.com"
      click_on "Register"

      expect(page).to have_content("Wayne's Dashboard")

      visit register_path

      fill_in "Name:", with: "Dwayne"
      fill_in "Email:", with: "partytime@gmail.com"
      click_on "Register"

      expect(page).to have_content("Unable to register. Please use a unique email address.")
    end
  end
end