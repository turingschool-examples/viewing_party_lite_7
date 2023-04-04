require 'rails_helper'

RSpec.describe '/', type: :feature do
  
  before do
    @steve = User.create!(name: "steve", email: "steve@steve.com", password: "steve123", role: 0)
    @ben = User.create!(name: "ben", email: "ben@ben.com", password: "ben123")
    
    visit '/'
  end

  describe "When a user visit's the landing page" do
    it "I should see the title of the Application" do
      expect(page).to have_content("Viewing Party")
    end

    it "I should see a button to the user new page" do
      expect(page).to have_link("Create New User", :href => "/users/new")
    end

    it "I should see a list of users emails when logged in" do
      expect(page).to_not have_content(@steve.email)

      click_link "Login"
      fill_in :email, with: @steve.email
      fill_in :password, with: @steve.password
      fill_in :password_confirmation, with: @steve.password

      click_on "Login"

      click_on "Landing Page"
      expect(page).to have_content(@steve.email)
      expect(page).to have_content(@ben.email)
    end

    it "I should see a link that returns me to the landing page" do
      expect(page).to have_link("Landing Page", :href => "/")
    end

    it 'I should see a link to the login page' do
      expect(page).to have_link("Login", :href => "/login")
    end

    it 'when I click the login link I should be taken to the login page' do
      click_link "Login"
      expect(current_path).to eq("/login")
      expect(@steve.logged_in?).to eq(false)
    end

    describe 'as a logged in user' do
      it 'I see a link to log out' do
        expect(page).to have_link("Login", :href => "/login")
        expect(page).to have_link("Create New User", :href => "/users/new")

        click_link "Login"

        fill_in :email, with: @steve.email
        fill_in :password, with: @steve.password
        fill_in :password_confirmation, with: @steve.password

        click_on "Login"
        expect(current_path).to eq("/users/#{@steve.id}")

        click_link "Landing Page"

        expect(page).to have_link("Log Out", :href => "/logout")
        
        click_link "Log Out"

        expect(page).to have_content("You have been logged out")
        expect(current_path).to eq("/")
        expect(page).to have_link("Login", :href => "/login")
        expect(page).to have_link("Create New User", :href => "/users/new")
      end
    end
  end
end