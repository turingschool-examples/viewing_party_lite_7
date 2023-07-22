require "rails_helper"

RSpec.describe "landing page", type: :feature do
  before(:each) do
    @user1 = User.create!(
      name: "John",
      email: "john@example.com",
      password: "abc123",
      password_confirmation: "abc123"
    )
    @user2 = User.create!(
      name: "Myles",
      email: "myles@example.com",
      password: "random",
      password_confirmation: "random"
    )
    @user3 = User.create!(
      name: "Boston",
      email: "boston@example.com",
      password: "foobar",
      password_confirmation: "foobar"
    )

    visit "/"
  end

  describe "when I visit the landing page" do
    it "displays a link to the home page and the title of the application" do
      expect(page).to have_link("Home")
      expect(page).to have_content("Viewing Party")

      click_link "Home"

      expect(current_path).to eq("/")
    end

    it "displays button log in an existing user if no session exists" do
      within("#buttons") do
        expect(page).to have_button("Log In")
        expect(page).to_not have_button("Log Out")

        click_button "Log In"
      end

      expect(current_path).to eq("/login")
    end

    it "displays a button to register a new user if no session exists" do
      within("#buttons") do
        expect(page).to have_button("Create a New User")
        expect(page).to_not have_button("Log Out")

        click_button "Create a New User"
      end

      expect(current_path).to eq("/register")
    end

    it "displays a button to log out if session exists" do
      visit "/login"

      fill_in :email, with: @user1.email
      fill_in :password, with: @user1.password
      click_button "Log In"

      expect(current_path).to eq(user_path(@user1))

      visit "/"

      within("#buttons") do
        expect(page).to have_button("Log Out")
        expect(page).to_not have_button("Log In")
        expect(page).to_not have_button("Create a New User")

        click_button "Log Out"
      end

      expect(current_path).to eq("/")

      within("#buttons") do
        expect(page).to have_button("Log In")
        expect(page).to have_button("Create a New User")
        expect(page).to_not have_button("Log Out")
      end
    end

    it "displays a list of existing users only if session exists" do
      within("#existing-users") do
        expect(page).to_not have_content("Existing Users")
        expect(page).to_not have_content(@user1.email)
        expect(page).to_not have_content(@user2.email)
        expect(page).to_not have_content(@user3.email)
      end

      visit "/login"

      fill_in :email, with: @user1.email
      fill_in :password, with: @user1.password
      click_button "Log In"

      visit "/"

      within("#existing-users") do
        expect(page).to have_content("Existing Users")
        expect(page).to have_content(@user1.email)
        expect(page).to have_content(@user2.email)
        expect(page).to have_content(@user3.email)
      end
    end
  end
end
