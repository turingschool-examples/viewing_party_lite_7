require 'rails_helper'

RSpec.describe 'Discover Movies', type: :feature do
  describe 'Movies Results Page ' do
    scenario "i visit the discover movie page and click either button then im redirected and see api data" do 
      u1 = User.create!(name: "Sean", email: "champion4lyfe@gmail.com")

      visit user_discover_index_path(u1)

      expect(page).to have_button("Discover Top Rated Movies")
      expect(page).to have_button("Search by Movie Title")
      
      click_button("Discover Top Rated Movies")
    end
  end
end