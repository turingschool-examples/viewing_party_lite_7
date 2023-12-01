require "rails_helper"

RSpec.describe "User Discover Page" do
  before(:each) do
    load_test_data
  end
  describe '#discover-page' do
    it 'can search a movie by title', :vcr do
      visit "/users/#{@user2.id}/discover"

      expect(page).to have_button("Top Rated Movies")
      expect(page).to have_button("Find Movies")

      fill_in :q, with: "Django"
      click_button("Find Movies")

      expect(current_path).to eq("/users/#{@user2.id}/movies")
    end

    it "button to find top-rated", :vcr do
      visit "/users/#{@user2.id}/discover"

      expect(page).to have_button("Top Rated Movies")
      expect(page).to have_button("Find Movies")

      click_button("Top Rated Movies")
      expect(current_path).to eq("/users/#{@user2.id}/movies")
    end
  end
  
end