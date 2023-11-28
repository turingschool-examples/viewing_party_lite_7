require "rails_helper"

RSpec.describe "Landing Page Index", type: :feature do
  before (:each) do
    @user1 = User.create!(name: "Scott DeVoss", email: "scottd@gmail.com")
    @user2 = User.create!(name: "Cory Powell", email: "coryp@yahoo.com")

    visit "/"
  end

  describe "When I visit '/'" do
    it "should show the title of application" do
      expect(page).to have_content("ViewingPartyLite7")
    end

    it "should have a button to create a new user" do
      expect(page).to have_button("Create a New User")

      click_button("Create a New User")

      expect(current_path).to eq("/new")

      expect(page).to have_field(:name)
      expect(page).to have_field(:email)

      fill_in(:name, with: "Jimmy Smith")
      fill_in(:email, with: "jimmysmith@gmail.com")

      click_button "Create User"

      expect(current_path).to eq("/")

      expect(page).to have_content("Jimmy Smith")
      expect(page).to have_content("jimmysmith@gmail.com")
    end

    it "should have a list of exisiting users which links to the users dashboard" do
      expect(page).to have_content("Exisiting Users")
      within("#existing_user") do
        expect(page).to have_link(@user1.email)
        expect(page).to have_link(@user2.email)

        click_link(@user1.email)
      end

      expect(current_path).to eq("/#{@user1.id}")

      expect(page).to have_content("Scott DeVoss")
      expect(page).to have_content("scottd@gmail.com")
      expect(page).to_not have_content("Cory Powell")

      expect(page).to have_link("Home")

      click_link("Home")

      expect(current_path).to eq("/")
    end

    it "should have a link to go back to the landing page (expected on every page)" do
      expect(page).to have_link("Home")

      click_link(@user1.email)
      expect(current_path).to eq("/#{@user1.id}")

      expect(page).to have_link("Home")

      click_link("Home")

      expect(current_path).to eq("/")
    end
  end
end