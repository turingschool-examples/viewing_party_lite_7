require 'rails_helper'

RSpec.describe 'User Movies Index Page' type: :feature do
  describe 'Top Rated Movies' do

    it "After clicking on Top Rated Movies button from Discover Page,
        I should see headers and links" do

      visit user_dashboard_discover_index_path(@user1)
      click_link "Top Rated Movies"
      
      expect(page).to have_content("Viewing Party")
      expect(page).to have_link("Home")
      expect(page).to have_link("Discover Movies")
    end
  end
end