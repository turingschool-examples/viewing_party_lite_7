require 'rails_helper'

RSpec.describe 'Create New User', type: :feature do
  describe 'When user visits "/register"' do
    before(:each) do
      @user = User.create!(name: 'Tommy', email: 'tommy_t@gmail.com', password:  "pegmel0715", password_confirmation:  "pegmel0715")

      visit register_user_path
    end
    
    it 'They see a Home link that redirects to landing page' do

      expect(page).to have_link('Home')

      click_link "Home"

      expect(current_path).to eq(root_path)
    end
    
    it 'They see a form to fill in their name, email, password, and password confirmation' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_field('Password confirmation')
      expect(page).to have_selector(:link_or_button, 'Create New User')    
    end
    
    it 'When they fill in the form with their name, email, and matching passwords, then they are taken to their dashboard page "/users/:id"' do
      fill_in :name, with: 'Tommy'
      fill_in :email, with: 'tommy_t@email.com'
      fill_in :password, with: 'pegmel0715'
      fill_in 'Password confirmation', with: 'pegmel0715'

      click_button 'Create New User'
    
      new_user = User.last

      expect(current_path).to eq(user_path(new_user))
      expect(page).to have_content('Successfully Added New User')
    end

    it 'when they fill in form with information, email (non-unique), submit, redirects to user show page' do
      fill_in :name, with: 'Tommy'
      fill_in :email, with: 'tommy_t@gmail.com'
      fill_in :password, with: 'pegmel0715'
      fill_in :password_confirmation, with: 'pegmel0715'

      click_button 'Create New User'

      expect(current_path).to eq(register_user_path)
      expect(page).to have_content('Email has already been taken')
    end

    it 'when they fill in form with missing information' do
      fill_in :name, with: ""
      fill_in :email, with: ""
      fill_in :password, with: ""
      fill_in :password_confirmation, with: ""
      click_button 'Create New User'

      expect(current_path).to eq(register_user_path)
      expect(page).to have_content("Name can't be blank, Email can't be blank, Email is invalid, Password digest can't be blank, Password can't be blank")
    end

    it 'They fill in form with invalid email format (only somethng@something.something)' do # Probably more invalid examples
      fill_in :name, with: "Sammy"
      fill_in :email, with: "sam sam@email.co.uk"
      fill_in :password, with: 'pegmel0715'
      fill_in :password_confirmation, with: 'pegmel0715'
      click_button 'Create New User'

      expect(current_path).to eq(register_user_path)
      expect(page).to have_content('Email is invalid')

      fill_in :name, with: "Sammy"
      fill_in :email, with: "sam@email..com"
      fill_in :password, with: 'pegmel0715'
      fill_in :password_confirmation, with: 'pegmel0715'
      click_button 'Create New User'

      expect(current_path).to eq(register_user_path)
      expect(page).to have_content('Email is invalid')

      fill_in :name, with: "Sammy"
      fill_in :email, with: "sam@emailcom."
      fill_in :password, with: 'pegmel0715'
      fill_in :password_confirmation, with: 'pegmel0715'
      click_button 'Create New User'

      expect(current_path).to eq(register_user_path)
      expect(page).to have_content('Email is invalid')

      fill_in :name, with: "Sammy"
      fill_in :email, with: "sam@emailcom@"
      fill_in :password, with: 'pegmel0715'
      fill_in :password_confirmation, with: 'pegmel0715'
      click_button 'Create New User'

      expect(current_path).to eq(register_user_path)
      expect(page).to have_content('Email is invalid')
    end

    it 'When they fill in form with mismatching password and password confirmation, they are then directed back to the "/register" path and a flash message pops up' do
      fill_in :name, with: 'Sammy'
      fill_in :email, with: 'Sammy_t@gmail.com'
      fill_in :password, with: 'pegmel0715'
      fill_in :password_confirmation, with: 'pegmel071'
      click_button 'Create New User'

      expect(current_path).to eq(register_user_path)
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end