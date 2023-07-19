# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home Page' do
  before(:each) do
    @user1 = User.create!(name: 'KD', email: 'kd@gmail.com', password: 'kd', password_confirmation: 'kd')
    @user2 = User.create!(name: 'Amy', email: 'amers@gmail.com', password: 'pw', password_confirmation: "pw")
    @user3 = User.create!(name: 'Wolfie', email: 'wolfie@gmail.com',  password: 'wolf', password_confirmation: 'wolf')
    @user4 = User.create!(name: 'Jess', email: 'jess@gmail.com', password: 'print', password_confirmation: 'print')
    
    visit root_path
  end
  describe 'Home page content' do
    it 'I see the Title of the Application and a Button to Create New User' do
      expect(page).to have_content('Viewing Party Lite 7')
      click_button('Register a New User')
      expect(current_path).to eq(register_path)
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

  describe "it verifies log in credentials" do
    it "can log in with valid credentials" do
      visit root_path
  
      click_on"Log In"
      expect(current_path).to eq(login_path)
  
      fill_in :email, with: @user3.email
      fill_in :password, with: @user3.password
      click_on "Log In"
  # save_and_open_page
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome Back #{@user3.name}!")
    end
  
    it "cannot log in with bad credentials" do
  
      click_on"Log In"
      expect(current_path).to eq(login_path)
  
      fill_in :email, with: @user3.email
      fill_in :password, with: "password"
      click_on "Log In"
  
      expect(current_path).to eq(login_path)
      expect(page).to have_content("Sorry your email or password is incorrect")
    end
  end

  describe "it verifies current user" do
    it "it checks if a user is logged in" do

      click_on"Log In"
      expect(current_path).to eq(login_path)
  
      fill_in :email, with: @user3.email
      fill_in :password, with: @user3.password
      click_on "Log In"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome Back #{@user3.name}!")
      expect(page).to have_button("Log Out")
      expect(page).to_not have_button"Log In"
      expect(page).to_not have_button'Register a New User'

      click_on"Log Out"
      expect(current_path).to eq(root_path)
      expect(page).to_not have_button("Log Out")
      expect(page).to have_button"Log In"
    end
  end
end
# As a logged in user 
# When I visit the landing page
# I no longer see a link to Log In or Create an Account
# But I see a link to Log Out.
# When I click the link to Log Out
# I'm taken to the landing page
# And I can see that the Log Out link has changed back to a Log In link