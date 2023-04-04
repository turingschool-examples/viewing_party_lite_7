# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page Index' do
  before(:each) do
    @user_1 = User.create!(name: 'Joe', email: 'joe@email.com', password: 'password1')
    @user_2 = User.create!(name: 'Bob', email: 'bob@email.com', password: 'password2')
    @user_3 = User.create!(name: 'Dan', email: 'dan@email.com', password: 'password3')
  end
  
  context 'As a user when I visit the landing page' do
    it 'I see the title of the application' do
      visit root_path
      expect(page).to have_content('Viewing Party')
    end

    it 'I see a button to create a new user' do
      visit root_path
      expect(page).to have_button('Create New User')
    end

    it "I see a list of existing users, that links to the user's dashboard" do
      visit root_path
      within('#existing_users') do
        expect(page).to have_content('Joe')
        expect(page).to have_content('Bob')
        expect(page).to have_content('Joe')
      end
    end

    it 'I see a link to go back to the landing page' do
      visit root_path
      within('#nav_bar') do
        expect(page).to have_link('Home')
        click_link('Home')
      end
      expect(current_path).to eq(root_path)
    end
  end

  context 'User Authentication: Logging out' do
    it 'I am able to log out as a user (if logged in) by clicking a button on the home page' do
      visit login_path

      fill_in :email, with: @user_1.email
      fill_in :password, with: @user_1.password
      click_on 'Log In'

      expect(page).to have_content("Welcome, #{@user_1.name}!")
      
      click_on 'Log Out'

      expect(current_path).to eq(root_path)
      expect(page).to have_link('Log In')
      expect(page).not_to have_content("Welcome, #{@user_1.name}!")
    end
  end
end
