require 'rails_helper'

RSpec.describe 'User Logout', type: :feature do
  before :each do
    @user3 = User.create!(name: 'Sooyung', email: 'sooyung@turing.edu', password: 'test', password_confirmation: 'test')
  end


  describe 'As a logged in user, when I visit /' do
    it 'does not have a link to log in or create an account' do
      visit '/'
      click_button 'Log In'

      fill_in(:email, with: 'sooyung@turing.edu')
      fill_in(:password, with: 'test')
      
      click_button 'Log In'

      visit '/'
      expect(page).to_not have_link('Log In')
      expect(page).to_not have_button('Create New User')
    end

    it 'has a link to log out' do
      visit '/'
      click_button 'Log In'

      fill_in(:email, with: 'sooyung@turing.edu')
      fill_in(:password, with: 'test')
      
      click_button 'Log In'

      visit '/'

      expect(page).to have_link('Log Out')
    end

    it 'logs you out when you click log out, and you see log in' do
      visit '/'
      click_button 'Log In'

      fill_in(:email, with: 'sooyung@turing.edu')
      fill_in(:password, with: 'test')
      
      click_button 'Log In'

      visit '/'

      expect(page).to have_link('Log Out')
      click_link('Log Out')
      # expect(page).to_not have_button('Create a New User')
      expect(page).to have_button('Log In')
      expect(page).to_not have_link('Log Out')
    end
  end
end