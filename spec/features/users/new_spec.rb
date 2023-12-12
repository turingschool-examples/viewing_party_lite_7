# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Registration', type: :feature do
  describe 'When I visit /register' do
    it 'has a form to create a new user' do
      visit root_path
      click_button 'Create a New User'

      expect(current_path).to eq(register_path)
      expect(page).to have_content('Register a New User')
      expect(page).to have_field('Name')
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_button('Create New User')
    end

    it 'creates a new user and redirects to the dashboard' do
      visit register_path

      fill_in(:user_name, with: 'River')
      fill_in(:user_email, with: 'riversong@tardis.net')
      fill_in(:user_password, with: 'test_password')
      fill_in(:user_password_confirmation, with: 'test_password')
      
      click_button 'Create New User'

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content('Welcome, River!')
      expect(page).to have_content("River's Dashboard")
    end

    it 'shows an error if the name is blank' do
      visit register_path
      fill_in(:user_email, with: 'username@email.net')

      click_button 'Create New User'

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Name can't be blank, Password can't be blank, and Password confirmation can't be blank")
    end

    it 'shows an error if the email is blank' do
      visit register_path
      fill_in(:user_name, with: 'River')

      click_button 'Create New User'

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Email can't be blank, Password can't be blank, and Password confirmation can't be blank")
    end

    it 'shows an error if password confirmation does not match' do
      visit register_path
      fill_in(:user_name, with: 'River')
      fill_in(:user_email, with: 'riversong@tardis.net')
      fill_in(:user_password, with: 'test_password')
      fill_in(:user_password_confirmation, with: 'no_matching_password')

      click_button 'Create New User'

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
