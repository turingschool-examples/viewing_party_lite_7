# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the /register page', type: :feature do
  describe 'When a user visits the register path they should see a form to register' do
    it 'the form should include: name, email(unique), register button' do
      visit '/register'

      fill_in 'Name', with: 'John Smith'
      fill_in 'Email', with: 'jsmith@aol.com'
      click_button 'Register'

      expect(current_path).to eq("/users/#{User.all.last.id}")
    end

    it 'the form should raise an error if name is empty' do
      visit '/register'

      fill_in 'Name', with: ''
      fill_in 'Email', with: 'jsmith@aol.com'
      click_button 'Register'

      expect(current_path).to eq('/register')

      expect(page).to have_content('Missing Inputs')
    end

    it 'the form should raise an error if email is empty' do
      visit '/register'

      fill_in 'Name', with: 'John Smith'
      fill_in 'Email', with: ''
      click_button 'Register'

      expect(current_path).to eq('/register')

      expect(page).to have_content('Missing Inputs')
    end

    it 'the form should raise an error if email is already in use' do
      User.create!(name: 'Some Guy', email: 'jsmith@aol.com')
      visit '/register'

      fill_in 'Name', with: 'John Smith'
      fill_in 'Email', with: 'jsmith@aol.com'
      click_button 'Register'

      expect(current_path).to eq('/register')

      expect(page).to have_content('Email already in use')
    end
  end
end
