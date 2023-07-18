# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home Page' do
  describe 'Home page content' do
    before(:each) do
      @user1 = User.create!(name: 'KD', email: 'kd@gmail.com', password: 'kd', password_confirmation: 'kd')
      @user2 = User.create!(name: 'Amy', email: 'amers@gmail.com', password: 'pw', password_confirmation: "pw")
      @user3 = User.create!(name: 'Jess', email: 'jess@gmail.com', password: 'print', password_confirmation: 'print')
      @user3 = User.create!(name: 'Wolfie', email: 'wolfie@gmail.com',  password: 'wolf', password_confirmation: 'wolf')

      visit root_path
    end
    it 'I see the Title of the Application and a Button to Create New User' do
      expect(page).to have_content('Viewing Party Lite 7')
      click_button('Register a New User')
      expect(current_path).to eq('/register')
    end

    it 'I see a List of Existing Users which links to the users dashboard' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user3.name)
    end

    it 'I see Link to go back to the landing page (this link will be present at the top of all pages)' do
      expect(page).to have_link('Home Page')
    end
  end
end
