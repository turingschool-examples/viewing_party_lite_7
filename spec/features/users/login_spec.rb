require 'rails_helper'

RSpec.describe 'Logging In' do
  describe 'happy path' do
    it 'can log in with valid credentials' do
      user = User.create!(name: 'Ethan', email: 'ethan@black.com', password: 'password123', password_confirmation: 'password123')
      
      visit root_path
      
      click_button "Log In"
      
      expect(current_path).to eq(login_path)
      
      within('#login-form') do
        fill_in(:email, with: user.email)
        fill_in(:password, with: user.password)
        click_button('Log In')
      end

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{user.name}")
    end
  end
  
  describe 'sad path' do
    it 'shows an error if a user tries to log in with invalid credentials' do
      user = User.create!(name: 'Ethan', email: 'ethan@black.com', password: 'password123', password_confirmation: 'password123')
      
      visit login_path
      
      within('#login-form') do
        fill_in(:email, with: user.email)
        fill_in(:password, with: "not a correct password")
        click_button('Log In')
      end

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Sorry, your credentials are bad")

      within('#login-form') do
        fill_in(:email, with: 'bad email at email dot com')
        fill_in(:password, with: user.password)
        click_button('Log In')
      end

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Sorry, your credentials are bad")
    end
  end
end
