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
      # save_and_open_page
    end
    
    it "takes input to create a new user" do
      visit register_path
      
      fill_in('Name', with: 'Jeff Goldblum')
      fill_in('Email', with: 'JurassicSnark@gmail.com')
      click_on("Create New User")
    end
    
  end
end

