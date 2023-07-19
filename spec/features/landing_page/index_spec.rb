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
  end

  describe "as a logged in user" do
    let!(:user_1) { create(:user) }

    # As a logged in user
    # When I visit the landing page
    # I no longer see a link to Log In or Create an Account
    # But I see a link to Log Out.
    # When I click the link to Log Out
    # I'm taken to the landing page
    # And I can see that the Log Out link has changed back to a Log In link
    it "doesn't display link to log in or create an accont" do
      visit login_path
      fill_in :email, with: user_1.email
      fill_in :password, with: "test"
      click_button "Submit"
      visit root_path

      expect(page).to_not have_link("Log In")
      expect(page).to_not have_button("Create new user")
    end

    it "displays a button to log out" do
      visit login_path
      fill_in :email, with: user_1.email
      fill_in :password, with: "test"
      click_button "Submit"
      visit root_path

      expect(page).to have_button("Log Out")
      click_button("Log Out")
      expect(current_path).to eq(root_path)
      expect(page).to_not have_button("Log Out")
      expect(page).to have_link("Log In")
    end
  end
end