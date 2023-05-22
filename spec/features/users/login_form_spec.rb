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

    it 'when I fill out the form with valid credentials I am redirected to my dashboard' do
      user = create(:user)

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'

      expect(current_path).to eq(user_path(user))
    end
  end
end