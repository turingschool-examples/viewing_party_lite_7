require 'rails_helper'

RSpec.describe 'Login Page' do 
  describe "When I visit '/login'" do 
    it "I see a formm to log in" do 
      user  = User.create(name: "Antoine", email: "antoine@gmail.com", password: "password")
      visit login_form_path

      fill_in :email, with: 'antoine@gmail.com'
      fill_in :password, with: 'password'
      click_button "Log In"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{user.name}!")
    end
  end
end