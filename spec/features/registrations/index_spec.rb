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
      expect(page).to have_button("Register")
    end

    it "Email should be unique" do
      visit "/register"
      fill_in("Name", with: "Dinkleberg")
      fill_in("Email", with: "timmyturner1@gmail.com")
      click_button "Register"
      save_and_open_page
      expect(current_path).to eq("/register")
      expect(page).to have_content("**Email taken. Please enter a different email.**")
    end

    it "Once the user registers they should be taken to a dashboard page '/users/:id', 
      where :id is the id for the user that was just created." do
      visit "/register"
      fill_in("Name", with: "Dinkleberg")
      fill_in("Email", with: "Dinkleberg123@gmail.com")
      click_button "Register"
      new_user = User.find_by(name: "Dinkleberg")
      expect(current_path).to eq(user_path(new_user))
      expect(page).to have_content("Name: Dinkleberg")
      expect(page).to have_content("Email: Dinkleberg123@gmail.com")
    end
  end
end