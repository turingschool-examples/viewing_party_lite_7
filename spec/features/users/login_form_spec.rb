require 'rails_helper'

RSpec.describe 'User Login Form' do
  before(:each) do
    visit '/login'
  end

  describe 'as a visitor when I visit the login page' do
    it 'has a form with email and password fields' do
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_button('Log In')
    end

    it 'when I fill out the form with valid credentials I am redirected to my dashboard and see a log out link from the landing page' do
      user = create(:user)

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'

      expect(current_path).to eq(dashboard_path)
      
      visit '/'

      expect(page).to have_link('Log Out')
    end

    it 'redirects back to the form if no email is found' do
      user = create(:user)

      fill_in 'Email', with: 'fake_email@gmail.com'
      fill_in 'Password', with: user.password
      click_button 'Log In'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('No user with that email found.')
    end

    it 'redirects back to the form if password doesn\'t authentica' do
      user = create(:user)

      fill_in 'Email', with: user.email
      fill_in 'Password', with: "Well this sure isn\'t my password! I hope"
      click_button 'Log In'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Incorrect password.')
    end

    it 'can log out a user' do
      user = create(:user)

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'

      expect(current_path).to eq(dashboard_path)
      
      visit '/'

      expect(page).to have_link('Log Out')
      click_link('Log Out')


      expect(current_path).to eq(root_path)
      expect(page).to_not have_link('Log Out')
      expect(page).to have_content('You have been logged out.')
      expect(page).to have_link('Log In')
      expect(page).to have_link('Create User')
    end
  end
end