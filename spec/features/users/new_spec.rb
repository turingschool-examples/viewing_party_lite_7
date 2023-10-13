require 'rails_helper'

RSpec.describe 'User Registration Form' do
  describe "when I visit '/register'" do
    it 'has a form to create a new user' do
      visit root_path
      click_on 'Create an Account'

      expect(current_path).to eq(register_path)
      expect(page).to have_content('Register a New User')
      expect(page).to have_field('name')
      expect(page).to have_field('email')
      expect(page).to have_button('Save')
    end

    it 'redirects to the dashboard page `/users/:id`' do
      visit register_path
      fill_in('Name', with: 'Marge')
      fill_in('Email', with: 'marge@email.com')

      click_button('Save')

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Marge's Dashboard")
    end

    it 'If name is blank, I see an error' do
      visit register_path
      fill_in('Name', with: '')
      fill_in('Email', with: 'NameLast@gmail.com')

      click_button('Save')

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Please fill out BOTH name and email")
    end

    it 'If email is blank, I see an error' do
      visit register_path
      fill_in('Name', with: 'Name')
      fill_in('Email', with: '')

      click_button('Save')

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Please fill out BOTH name and email")
    end
  end
end
