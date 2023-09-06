require 'rails_helper'

RSpec.describe 'Login Page', type: :feature do
  describe "When I visit '/login'" do
    before :each do
      @user = User.create!(name: 'John', email: 'john@example.com', password: 'fakePassword', password_confirmation: 'fakePassword')
      
      visit login_path
    end

    it 'has fields to enter my email and password' do
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_button('Sign In')
    end

    it 'goes to user dashboard when valid credentials are entered' do
      fill_in('Email', with: 'john@example.com')
      fill_in('Password', with: 'fakePassword')
      click_button('Sign In')

      expect(current_path).to eq(user_path(@user))
    end

    it 'shows error if invalid email is entered' do
      fill_in('Email', with: 'doesnt-exist@example.com')
      fill_in('Password', with: 'fakePassword')
      click_button('Sign In')

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Invalid credentials. Please Try again.')
    end

    it 'shows error if invalid password is entered' do
      fill_in('Email', with: 'john@example.com')
      fill_in('Password', with: 'incorrectPassword')
      click_button('Sign In')

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Invalid credentials. Please Try again.')
    end
  end
end
