# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User Registration Page Index", type: :feature do
  before (:each) do
    @user1 = User.create!(name: "Scott DeVoss", email: "scottd@gmail.com")
    @user2 = User.create!(name: "Cory Powell", email: "coryp@yahoo.com")

    visit "/register"
  end

  describe "When I visit '/register'" do
    it "should show a form to register" do
      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
      
      expect(page).to have_button("Create New User")
    end

    it "fills in the form and is taken to the dashboard page 'users/:id' where it is the id of the user that was just created" do
      fill_in(:name, with: "Peyton Manning")
      fill_in(:email, with: "peyton18@yahoo.com")

      click_button "Create New User"
      expect(current_path).to eq("/users/#{User.last.id}")
    end

    it "requires you to fill in every field" do
      fill_in(:name, with: "Peyton Manning")

      click_button "Create New User"

      expect(page).to have_content("Please Fill in All Fields/Email is already taken")

      expect(current_path).to eq("/register")
    end

    it "requires you to have a unique email address" do 

      fill_in(:name, with: "Peyton Manning")
      fill_in(:email, with: "peyton18@yahoo.com")

      click_button "Create New User"

      visit "/register"

      fill_in(:name, with: "John Elway")
      fill_in(:email, with: "peyton18@yahoo.com")

      click_button "Create New User"
      
      expect(page).to have_content("Please Fill in All Fields/Email is already taken")

      expect(current_path).to eq("/register")
    end
  end
end
