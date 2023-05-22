require 'rails_helper'

RSpec.describe 'User Registration Page' do
  describe 'as a new user, when I visit the user registration page' do
    it 'I see a form to register as a new user' do
      visit "/register"

      expect(page).to have_field('Username:')
      expect(page).to have_field('Email:')
      expect(page).to have_field('Password:')
      expect(page).to have_button('Create User')
    end

    it 'I can fill out the form and submit to create a new user' do
      visit "/register"

      name = "angelbyun"
      email = "abyun22@turing.edu"
      password = "12345"

      fill_in :name, with: name
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password
      click_button 'Create User'

      expect(page).to have_content("Welcome, #{name}!")
    end

    it 'I cannot create a new user without filling out all required fields' do
      visit "/register"

      name = "angelbyun"
      email = "abyun22@turing.edu"
      password = "12345"

      fill_in :name, with: name
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: "ABC"
      click_button 'Create User'

      expect(page).to have_content("Passwords do not match!")
      expect(current_path).to eq("/register")
    end
  end
end