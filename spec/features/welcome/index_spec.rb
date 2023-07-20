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

    it "displays button log in an existing user" do
      within("#login") do
        expect(page).to have_button("Log In")

        click_button "Log In"
      end

      expect(current_path).to eq("/login")
    end

    it "displays a button to register a new user" do
      within("#register") do
        expect(page).to have_button("Create a New User")

        click_button "Create a New User"
      end

      expect(current_path).to eq("/register")
    end

    it "displays a list of existing users" do
      within("#existing-users") do
        expect(page).to have_content("Existing Users")
        expect(page).to have_link(@user1.email)
        expect(page).to have_link(@user2.email)
        expect(page).to have_link(@user3.email)
      end
    end
  end
end
