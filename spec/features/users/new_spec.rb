# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New User Registration Page' do
  before(:each) do
    visit '/register'
  end

  context "When a user visits the '/register' path" do
    it "I see a form to create a new user, once created I am take back to that user's dashboard" do
      fill_in 'Name', with: 'Pete'
      fill_in 'Email', with: 'pete@email.com'

      click_on 'Create User'
      expect(page).to have_content('Pete has been created!')
      expect(current_path).to eq("/users/#{User.last.id}")
    end

    it "If I do not fill out the form and try to submit, I should stay on the create page" do
      fill_in 'Name', with: nil
      fill_in 'Email', with: nil
      click_on 'Create User'
      
      expect(page).to have_content('Cannot create! Please fill out all fields')
      expect(current_path).to eq('/register')
    end
  end
end
