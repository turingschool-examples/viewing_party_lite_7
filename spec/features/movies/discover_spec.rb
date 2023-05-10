# As an user,
# When I visit the '/users/:id/discover' path, where :id, is the id of a valid user,
# I should see

#  Button to Discover Top Rated Movies
#  A text field to enter keyword(s) to search by movie title
#  A Button to Search by Movie Title
# Details When the user clicks on the Top Rated Movies OR the search button, 
# they should be taken to the movies results page (more details of this on the Movies Results Page issue.

require 'rails_helper'

RSpec.describe "Movies Discover page" do
  before(:each) do
    test_data
  end
  describe "As a user, when I visit the '/users/:id/discover' path"
    it "has a button to discover top rated movies" do
      visit "/users/#{@user_1.id}/discover"
      
      within("#top-movies") do
        expect(page).to have_button("Find Top Rated Movies")
        click_button "Find Top Rated Movies"
      end

      expect(current_path).to eq("/users/#{@user_1.id}/movies")
    end

    it "can search by movie title" do
      visit "/users/#{@user_1.id}/discover"

      within("#search-movies") do
        fill_in(:search, with: "Fight Club")
        click_button "Find Movies"
      end

      expect(current_path).to eq("/users/#{@user_1.id}/movies")
      expect(page).to have_content("Fight Club")
    end

end