require 'rails_helper'

RSpec.describe 'Registration Index Page', type: :feature do
  before(:each) do
    user1 = User.create!(name: "Timmy Turner", email: "timmyturner1@gmail.com")
    user2 = User.create!(name: "Wanda", email: "ilovecosmo1@gmail.com")
    user3 = User.create!(name: "Cosmo", email: "ilovewanda1@gmail.com")
  end
  
  # User story "User Registration Page"
  describe "When a user visits the '/register' path they should see a form to register." do
    it "includes the users name, email and register button" do
      visit "/register"
      expect(page).to have_content("Registration Form")
      expect(page).to have_content("Name")
      expect(page).to have_content("Email")
      expect(page).to have_content("Register")
    end

    it "Email should be unique" do
      visit "/register"
      fill_in(:name, with: "Dinkleberg")
      fill_in(:name, with: "timmyturner1@gmail.com")
      expect(current_path).to eq("/register")
      expect(page).to have_content("Email taken. Please enter a different email.")
    end

    it "Once the user registers they should be taken to a dashboard page '/users/:id', 
      where :id is the id for the user that was just created." do
      visit "/register"
      fill_in(:name, with: "Dinkleberg")
      fill_in(:name, with: "Dinkleberg123@gmail.com")
      click_button "Register"
      expect(current_path).to eq('/users/:id')
      expect(page).to have_content("Dinkleberg")
      expect(page).to have_content("Dinkleberg123@gmail.com")
    end
  end
end