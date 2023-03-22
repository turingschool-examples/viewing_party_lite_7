require 'rails_helper'

RSpec.describe "user registration page" do
  before :each do
    User.delete_all
  end
  
  describe "initial testing" do
    it "exists and has a registration form" do
      visit register_path
      
      expect(page).to have_field("Name")
      expect(page).to have_field("Email")
      expect(page).to have_button("Create New User")
    end
    
    it "takes input to create a new user" do
      
      visit register_path
      
      fill_in('Name', with: 'Lightning McQueen')
      fill_in('Email', with: 'Kachow@cars.net')
      click_on("Create New User")

      expect(current_path).to eq(root_path)
      expect(page).to have_content("User has been created!")
    end
    
    it "won't create a user with an already used email" do
      user = User.create(name: "Lightning McQueen", email: "kachow@cars.net")
      
      visit register_path
      
      fill_in('Name', with: 'Chick Hicks')
      fill_in('Email', with: 'kachow@cars.net')
      click_on("Create New User")

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Email has already been taken")
    end
  end
end

