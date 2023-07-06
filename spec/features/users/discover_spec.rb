require "rails_helper"

RSpec.describe "User Discover" do
  describe "user discover movies path" do
    before :each do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @user3 = FactoryBot.create(:user)
      @user4 = FactoryBot.create(:user)

      visit user_discover_index_path(@user1.id)
    end

    it "has button to discover movies" do
      expect(page).to have_button "Discover Top Rated Movies"
      click_button "Discover Top Rated Movies"
      expect(current_path).to eq user_movies_path(@user1.id)
    end

    it "can search for movies with keywords" do
      expect(page).to have_field "Keyword"
    end

    it "has button to search movies" do
      expect(page).to have_button "Search by Movie Title"
      
      fill_in "Keyword", with: "Sandlot"
      click_button "Search by Movie Title"
      expect(current_path).to eq user_movies_path(@user1.id)
    end
  end
end