require "rails_helper"

RSpec.describe "User can search for movies" do
  before(:each) do
    @user1 = create(:user)
  end
  describe "When a user visits the discover page", :vcr do
    it "can search by movie title" do
      visit discover_path

      click_button "Discover Top Rated Movies"
      expect(current_path).to eq(movies_path)
    end

    it "can search by title" do
      visit discover_path

      fill_in :search_field, with: "The Dark Knight"
      click_button "Search"
      expect(current_path).to eq(movies_path)
    end
  end
end
