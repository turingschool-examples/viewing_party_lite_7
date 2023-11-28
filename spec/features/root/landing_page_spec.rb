require "rails_helper"

RSpec.describe "Landing Page", type: :feature do
  # When a user visits the root path they should be on the landing page ('/') which includes:
  # Title of Application
  # Button to Create a New User
  # List of Existing Users which links to the users dashboard
  # Link to go back to the landing page (this link will be present at the top of all pages)
  describe "welcome#root" do
    it "has the app's title" do
      visit root_path

      expect(page).to have_content "Viewing Party Lite"
    end

    it "has a button to create a new user" do
      visit root_path

      expect(page).to have_button "Create User"
    end

    it "shows existing users with links to their dashboards" do
    end
  end
end
