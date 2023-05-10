# When I visit the discover movies page,
# and click on either the Top Movies button or the Search button,
# I should be taken to the movies results page (users/:user_id/movies) where I see:

#  Title (As a Link to the Movie Details page)
#  Vote Average of the movie
# Details: There should only be a maximum of 20 results. The above details should be listed for each movie.

# I should also see a button to return to the Discover Page.

require 'rails_helper'

RSpec.describe "Movies Results page" do
  before(:each) do
    test_data
  end
  describe "As a user, when I visit the movie results page from the discover movies page" do
    it "displays the movie title as a link to the movie details page", :vcr do
      visit "/users/#{@user_1.id}/discover"

      within("#search-movies") do
        fill_in(:search, with: "Fight Club")
        click_button "Find Movies"
      end

      within("#results") do
        expect(page).to have_link("Fight Club")
        click_link "Fight Club"
      end

      expect(current_path).to eq("/users/#{@user_1.id}/movies/550")
    end
    xit "displays the vote average of the movie" do

    end

    xit "does not display more than 20 results" do

    end

    xit "has a button to return to the discover page" do

    end
  end
end