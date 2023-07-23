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
      # save_and_open_page
      expect(page).to have_content('Viewing Party Lite 7')
      click_button('Register a New User')
      expect(current_path).to eq(register_path)
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

  describe "Being a registered user I see a list of emails of existing users" do
    it "If I'm a registered user see a List of Emails of Existing Users not their names" do
      click_on"Log In"
      expect(current_path).to eq(login_path)
      
      fill_in :email, with: @user3.email
      fill_in :password, with: @user3.password
      click_on "Log In"
  
      expect(current_path).to eq(root_path)
      
      expect(page).to have_content(@user1.email)
      expect(page).to have_content(@user2.email)
      expect(page).to have_content(@user3.email)
      expect(page).to have_content(@user4.email)
      
      expect(page).to_not have_content(@user1.name)
      expect(page).to_not have_content(@user2.name)
      expect(page).to_not have_content(@user4.name)
    end
  end

  describe "As a visitor I visit the home page and try to visit my dashboard page" do
    it "Sad Path I see a message telling me that I must be logged in or registered to access it" do
      visit dashboard_path

      expect(page).to have_content("Please log in to visit your Dashboard")
    end
  end
end
# As a visitor
# When I visit the landing page
# And then try to visit '/dashboard'
# I remain on the landing page
# And I see a message telling me that I must be logged in or registered to access my dashboard

# As a visitor
# If I go to a movies show page 
# And click the button to create a viewing party
# I'm redirected to the movies show page, and a message appears 
# to let me know I must be logged in or registered to create a movie party. 