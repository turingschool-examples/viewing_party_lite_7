require "rails_helper"

RSpec.describe "User can search for movies" do
  before(:each) do
    @user1 = create(:user)
  end
  describe "When a user visits the discover page", :vcr do
    it "can search by movie title" do
      visit "/users/#{@user1.id}/discover"

      click_button "Discover Top Rated Movies"
      expect(current_path).to eq("/users/#{@user1.id}/movies")
    end

    it "can search by title" do
      visit "/users/#{@user1.id}/discover"

      fill_in :search_field, with: "The Dark Knight"
      click_button "Search"
      expect(current_path).to eq("/users/#{@user1.id}/movies")
    end
  end
end
