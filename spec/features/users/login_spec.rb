require 'rails_helper'

RSpec.describe "User Login Form Page" do
  describe "User Login Form" do
    before :each do
      @user = User.create!(email: "email@email.com", name: "Email", password: "secretpassword")
    end
    
    it "page has login information" do
      visit login_path
      expect(page).to have_field "Email"
      expect(page).to have_field "Password"
      expect(page).to have_button "Login"
    end
    
    it "logs in user successfully" do
      visit login_path
      fill_in :email, with: "email@email.com"
      fill_in :password, with: "secretpassword"
      click_button "Login"
      user = User.find_by(email: "email@email.com")
      expect(current_path).to eq(user_path(user.id))
      expect(page).to have_content("#{user.name}'s Dashboard")
    end
    
    it "missing password" do
      visit login_path
      fill_in :email, with: "email@email.com"
      click_button "Login"
      
      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid email or password")
    end

    it "missing email" do
      visit login_path
      fill_in :password, with: "secretpassword"
      click_button "Login"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid email or password")
    end
  end
end