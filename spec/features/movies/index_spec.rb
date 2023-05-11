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
    test_movie
  end
  describe "As a user, when I visit the movie results page from the discover movies page" do
    before(:each) do
      @movie = Movie.new(@data)
    end
    it "displays the movie title as a link to the movie details page", :vcr do
      visit "/users/#{@user_1.id}/discover"

      within("#search-movies") do
        fill_in(:search, with: @movie.title.to_s)
        click_button "Find Movies"
      end

      within("#results") do
        expect(page).to have_link(@movie.title.to_s)
        click_link @movie.title.to_s
      end

      expect(current_path).to eq("/users/#{@user_1.id}/movies/#{@movie.id}")
    end

    it "displays the vote average of the movie", :vcr do
      visit "/users/#{@user_1.id}/discover"

      within("#search-movies") do
        fill_in(:search, with: @movie.title.to_s)
        click_button "Find Movies"
      end

      within("#movie-#{@movie.id}") do
        expect(page).to have_content("Vote Average: #{@movie.vote_average}")
      end
    end

    it "has a button to return to the discover page", :vcr do
      visit "/users/#{@user_1.id}/movies"

      expect(page).to have_button("Discover Page")
      click_button "Discover Page"
      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end

    it "displays top rated movies if chosen from discover page", :vcr do
      visit "/users/#{@user_1.id}/discover"

      within("#top-movies") do
        click_button "Find Top Rated Movies"
      end

      within("#results") do
        expect(page).to have_content("The Godfather")
        expect(page).to have_content("The Shawshank Redemption")
        expect(page).to have_content("The Godfather Part II")
      end
    end

    it "displays a message if there are no movie search results" do
      visit "/users/#{@user_1.id}/movies"

      within("#results") do 
        expect(page).to have_content("No results.")
      end
    end
  end
end
