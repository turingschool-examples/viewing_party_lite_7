# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Registration' do
  describe 'When I visit the user registration page' do
    it 'can create a new user' do
      visit register_path
      fill_in :user_name, with: 'Bob'
      fill_in :user_email, with: 'bob@bob.com'
      click_button 'Register'

      user = User.last
      expect(current_path).to eq(dashboard_path(user.id))
    end

    it "can't create a new user without a name" do
      visit register_path
      fill_in :user_name, with: 'Tim'
      fill_in :user_email, with: ''
      click_button 'Register'

      expect(current_path).to eq(register_path)
      expect(page).to have_content('Please fill in all fields.')
    end
  end
end
