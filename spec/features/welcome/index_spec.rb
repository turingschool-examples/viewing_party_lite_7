# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
  before :each do
    @user_1 = User.create!(name: 'Archer', email: 'archer@email.com')
    @user_2 = User.create!(name: 'Pam', email: 'pam@email.com')
    @user_3 = User.create!(name: 'Lana', email: 'lana@email.com')
  end

  describe "When visiting the root path '/' as a visitor" do
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

    it 'lists all users names' do
      visit root_path

      within('div#all-users') do
        expect(page).to have_content('Existing Users')
        expect(page).to have_content(@user_1.email)
        expect(page).to have_content(@user_2.email)
        expect(page).to have_content(@user_3.email)
      end
    end
  end
end
