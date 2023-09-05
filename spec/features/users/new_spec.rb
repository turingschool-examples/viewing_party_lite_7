# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Registration' do
  describe 'When I visit the user registration page' do
    it 'can create a new user' do
      visit register_path
      fill_in :user_name, with: 'Bob'
      fill_in :user_email, with: 'bob@bob.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_button 'Register'

      user = User.last
      expect(current_path).to eq(dashboard_path(user.id))
    end

    it "can't create a new user without a name" do
      visit register_path
      fill_in :user_name, with: ''
      fill_in :user_email, with: '@tim@tim.com'
      click_button 'Register'

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Name can't be blank")
    end

    it "must have unique email address" do
      user1 = User.create!(name: "Jim Bob", email: "Jbob@somewhere.com", password: 'password123', password_confirmation: 'password123')
      visit register_path

      fill_in :user_name, with: "Ace Ventura"
      fill_in :user_email, with: "Jbob@somewhere.com"
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_button "Register"

      user = User.last
      expect(current_path).to_not eq(dashboard_path(user.id))
      expect(page).to have_content("Email has already been taken")
      expect(page).to have_current_path(register_path)
    end

    it "confirms that password and password confirmation match before creation" do
      visit register_path
      
      fill_in :user_name, with: "Phillip Philson"
      fill_in :user_email, with: "philguy@guy.com"
      fill_in :user_password, with: "password"
      fill_in :user_password_confirmation, with: "passworD"
      click_button "Register"
      
      expect(current_path).to eq(register_path)
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
