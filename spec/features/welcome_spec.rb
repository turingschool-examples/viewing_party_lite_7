require "rails_helper"

RSpec.describe "/", type: :feature do
  describe "when a user visits root path" do
    it "should be the landing page with the title of the app" do
      visit root_path
      expect(page).to have_content("Viewing Party")
    end

    it "I see a link to take me back to the welcome page" do
      visit root_path

      click_link "Home"

      expect(current_path).to eq(root_path)
    end

    it "displays a button to create a new user" do
      visit root_path

      expect(page).to have_button("Create a New User")
    end

    it "has a list of Existing Users which links to the users dashboard" do
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)

      visit root_path

      within(".users") do
        expect(page).to have_content("Existing Users")
        expect(page).to have_link(user1.email)
        expect(page).to have_link(user2.email)
        expect(page).to have_link(user3.email)
      end
    end
  end
end
