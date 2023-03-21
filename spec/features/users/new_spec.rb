require 'rails_helper'

RSpec.describe "user registration page" do
  before :each do
    User.delete_all
    
    visit users_path
  end
  
  describe "initial testing" do
    it "exists and has a registration form" do
      expect(page).to have_field("Name")
      expect(page).to have_field("Email")
      expect(page).to have_button("Create New User")
    end
  end
end

