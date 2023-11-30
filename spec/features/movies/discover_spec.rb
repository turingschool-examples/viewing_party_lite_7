require "rails_helper"

RSpec.describe "Discover Movies", type: :feature do
  before(:each) do
    @user = create :user
  end

  describe "redirect action from user dashboard" do
    it "routes from user dashboard to the discover movies page" do
      visit user_path(@user)

      click_button "Discover Movies"

      expect(page).to have_current_path discover_user_path(@user)
    end
  end

  # As an user,
  # When I visit the '/users/:id/discover' path, where :id, is the id of a valid user,
  # I should see

  # Button to Discover Top Rated Movies
  # A text field to enter keyword(s) to search by movie title
  # A Button to Search by Movie Title
  # Details When the user clicks on the Top Rated Movies OR the search button,
  # they should be taken to the movies index page (more details of this on the Movies Results Page issue.

  # When I visit the discover movies page,
  # and click on either the Top Movies button or the Search button,
  # I should be taken to the movies results page (users/:user_id/movies) where I see:
  #
  # Title (As a Link to the Movie Details page)
  # Vote Average of the movie
  # Details: There should only be a maximum of 20 results.
  # The above details should be listed for each movie.
  # 
  # I should also see a button to return to the Discover Page.

  describe "button to discover top rated movies" do
    it "shows the Top 20 highest rated movies from api", :vcr do
      visit discover_user_path(@user)

      click_button "Find Top Rated Movies"

      expect(page).to have_current_path user_movies_path(@user) + "?q=top+rated"

      movies = MovieFacade.top_rated  # should be available because of controller object-instantiation

      movies.each do |movie|
        expect(page).to have_content movie.title
      end
    end
  end

  describe "a search field for movie title" do
    it "returns the top matches based on title query", :vcr do
      visit discover_user_path(@user)

      fill_in :q, with: "Star Wars"
      click_button "Find Movies"

      expect(page).to have_content "Star Wars"
    end
  end

  describe "redirect to movie show page when clicked" do
    it "visits the movie show page when movie link clicked" do
      movie = create :movie

      visit user_movie_path(@user, movie)
    end
  end
end
