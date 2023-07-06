require "rails_helper"

RSpec.describe "/users/:id/discover, Discover Movies Dashboard", type: :feature do
  let!(:user) { create(:user) }

  describe "on the discover movies dashboard" do
    it "I see a page title of Discover Movies" do
      visit user_discover_index_path(user)
      expect(page).to have_content("Discover Movies")
    end

    it "has a button to discover top rated movies" do
      visit user_discover_index_path(user)

      click_button("Find Top Rated Movies")

      expect(current_path).to eq(user_movies_path(user))
    end

    it "has a form to find movies via keyword" do
      visit user_discover_index_path(user)

      within ".search-movies" do
        fill_in "Search:", with: "Shrek"
        click_button "Find Movies"
      end

      expect(current_path).to eq(user_movies_path(user))
    end
  end
end
