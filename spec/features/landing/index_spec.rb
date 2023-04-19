# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page Index' do
  before(:each) do
    @user_1 = User.create!(name: 'Joe', email: 'joe@email.com', password: 'password1')
    @user_2 = User.create!(name: 'Bob', email: 'bob@email.com', password: 'password2')
    @user_3 = User.create!(name: 'Dan', email: 'dan@email.com', password: 'password3', role: 1)
  end
  
  context 'As a visitor when I visit the landing page' do
    it 'I see the title of the application' do
      visit root_path
      expect(page).to have_content('Viewing Party')
    end

    it 'I see a button to create a new user' do
      visit root_path
      expect(page).to have_link('Create New User')
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
    
  it "I do not see a list of existing users," do
    visit root_path
    expect(page).not_to have_content('Joe')
    expect(page).not_to have_content('Bob')
    expect(page).not_to have_content('Joe')
  end

  it "I see a link to '/dashboard' that errors out if I am not logged in" do
    visit root_path

    click_on 'Dashboard'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('You must be logged in or registered to access this page')
  end

  it "I see a link to '/dashboard' that successfully routes if logged in" do
    visit login_path
      
    fill_in :email, with: @user_3.email
    fill_in :password, with: @user_3.password
    click_on 'Log In'

    click_on 'Dashboard'

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content('Dashboard Page')
  end

  context 'As a member (logged in) when I visit the landing page' do
    it "I see a link to log out that ends my current session" do
      visit login_path
      
      fill_in :email, with: @user_3.email
      fill_in :password, with: @user_3.password
      click_on 'Log In'
      
      click_on 'Log Out'
      
      expect(current_path).to eq(root_path)
      expect(page).to have_link('Log In')
    end
    
    it 'I see a list of existing users with only their emails' do
      visit login_path

      fill_in :email, with: @user_3.email
      fill_in :password, with: @user_3.password
      click_on 'Log In'

      within('#existing_users') do
        expect(page).to have_content('joe@email.com')
        expect(page).to have_content('bob@email.com')
        expect(page).to have_content('dan@email.com')
      end
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
