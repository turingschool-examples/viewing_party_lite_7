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
end
