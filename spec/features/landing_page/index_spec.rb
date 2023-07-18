require "rails_helper"

RSpec.describe "landing page - index '/' " do
  describe "as a visitor" do
    describe "when I visit the landing page" do

      let!(:user_1) { create(:user) }
      it "displays landing page" do
        visit "/"
        expect(page).to have_content("Viewing Party Manager")
      end

      it "has button to create new user" do
        visit "/"
        expect(page).to have_button("Create new user")
        click_button "Create new user"
        expect(current_path).to eq("/register")
      end

      it "displays list of all users that links to users dashboard" do
        visit "/"
        expect(page).to have_content("All Users")
        click_link "#{user_1.name}"
        expect(current_path).to eq("/users/#{user_1.id}")
        expect(page).to have_content("#{user_1.name}'s Dashboard")
        expect(page).to have_content(user_1.name)
      end

      it "links to welcome page" do
        visit "/users"
        click_link "Welcome Page"
        expect(current_path).to eq("/")
      end
    end
  end

  describe "as a registered user" do
    # As a registered user
    # When I visit the landing page `/`
    # I see a link for "Log In"
    # When I click on "Log In"
    # I'm taken to a Log In page ('/login') where I can input my unique email and password.
    # When I enter my unique email and correct password
    # I'm taken to my dashboard page

    it "displays a link for 'log in'" do
      visit root_path
      expect(page).to have_link("Log In")
      click_link "Log In"
      expect(current_path).to eq(login_path)
    end

    # As a registered user
    # When I visit the landing page `/`
    # And click on the link to go to my dashboard
    # And fail to fill in my correct credentials
    # I'm taken back to the Log In page
    # And I can see a flash message telling me that I entered incorrect credentials.
    it ""
  end
end