require 'rails_helper'

RSpec.describe 'user registration page', type: :feature do
  before(:all) do
    visit '/register'
  end

  describe 'when I visit the registration page' do
    it 'I should see a form with a text field for name and email and a button to register' do
      expect(page).to have_content('Register a New User')
      expect(page).to have_field('Name')
      expect(page).to have_field('Email')
      expect(page).to have_button('Create New User')
    end
  end
# When a user visits the /register path they should see a form to register.

# The form should include:

# Name
# Email (must be unique)
# Register Button
# Once the user registers they should be taken to a dashboard page 
# /users/:id, where :id is the id for the user that was just created.
end