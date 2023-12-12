require 'rails_helper'

RSpec.describe 'User Logout', type: :feature do
  before :each do
    @user3 = User.create!(name: 'Sooyung', email: 'sooyung@turing.edu', password: 'test', password_confirmation: 'test')
  end


  describe 'As a logged in user, when I visit /' do
    it 'does not have a link to log in or create an account' do
      visit '/'
      click_link 'Log In'

      fill_in(:email, with: 'sooyung@turing.edu')
      fill_in(:password, with: 'test')
      
      click_button 'Log In'

      visit '/'
      expect(page).to_not have_content('Log In')
      expect(page).to_not have_content('Create New User')
    end
  end
end