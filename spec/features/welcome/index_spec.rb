# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
  before :each do
    @user_1 = User.create!(name: 'Michael', email: 'michaelisvcool@email.com', password: 'test123!', password_confirmation: 'test123!')
    @user_2 = User.create!(name: 'Sara', email: 'sara1234@email.com', password: 'test123!', password_confirmation: 'test123!')
    @user_3 = User.create!(name: 'Elena', email: 'iheartmydogs@email.com', password: 'test123!', password_confirmation: 'test123!')
  end

  describe "When visiting the root path '/'" do
    it 'has the title of the application' do
      visit root_path

      within('div#title') do
        expect(page).to have_content('Viewing Party')
      end
    end

    it "has a link to go to the home page '/' " do
      visit root_path

      within('.nav-bar') do
        expect(page).to have_link('Home', href: root_path)
      end
    end

    it 'has a button to create a new user' do
      visit root_path

      within('div#homepage-buttons') do
        expect(page).to have_link('Create an Account')
        click_link('Create an Account')
      end

      expect(current_path).to eq(register_path)
    end

    it 'has a button for existing users to login' do
      visit root_path

      within('div#homepage-buttons') do
        expect(page).to have_link('Sign In')
        click_link('Sign In')
      end

      expect(current_path).to eq(login_path)
    end
  end

  describe "when I visit '/' as a logged in user" do
    it 'no longer shows the login or create account buttons' do
      visit login_path
      fill_in('Email', with: @user_1.email)
      fill_in('Password', with: @user_1.password)
      click_button('Sign In')

      visit root_path

      expect(page).to_not have_link('Sign In')
      expect(page).to_not have_link('Create an Account')
    end

    it 'instead shows a button to logout' do
      visit login_path
      fill_in('Email', with: @user_1.email)
      fill_in('Password', with: @user_1.password)
      click_button('Sign In')

      visit root_path

      expect(page).to have_link('Log Out')
    end

    it 'When [Log Out] is clicked, it redirects to landing page' do
      visit login_path
      fill_in('Email', with: @user_1.email)
      fill_in('Password', with: @user_1.password)
      click_button('Sign In')

      visit root_path
      click_link('Log Out')

      expect(current_path).to eq(root_path)
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Create an Account')
    end
  end
end
