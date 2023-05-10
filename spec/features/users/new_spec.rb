require 'rails_helper'

RSpec.describe 'Registration Page' do
  describe 'as a user when I visit the registration page I see a form to register' do
    it 'displays registration form' do
      visit '/register'

      within '#registration-form' do 
#  save_and_open_page
        expect(page).to have_field('name')
        expect(page).to have_field('email')
        expect(page).to have_content('Name')
        expect(page).to have_content('Email')
        expect(page).to have_button('Save')
      end
    end

    it 'can fill in form and submit' do
      visit '/register'

      within '#registration-form' do
        fill_in 'name', with: 'Barnaby Jones'
        fill_in 'email', with: 'freshtodeath@aol.com'
        
        click_button 'Save'
      end

      expect(current_path).to eq(user_path(User.last.id))
    end
  end
end