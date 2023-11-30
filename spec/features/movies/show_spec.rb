require "rails_helper"
require_relative "../../../app/poros/movie"

RSpec.describe "Movie details page", type: :feature do
  before(:each) do
    @user = create :user
    @movie = Poro::Movie.new({
      title: "Fastball",
      id: 330068
    })
    @movie.set_genres_and_runtime({genres: [{name: "Documentary"}], runtime: 87})
    @movie.set_cast_and_reviews({cast: [{name: "Nolan Ryan"}], reviews: []})
  end
  # US Movies Details Page
  # When I visit a movie's detail page (/users/:user_id/movies/:movie_id) where :id is a valid user id,
  # I should see
  #
  # a button to Create a Viewing Party
  # a button to return to the Discover Page
  # I should also see the following information about the movie:
  describe "available interfaces" do
    it "has a button to create a Viewing Party", :vcr do
      # Details
      # The "Create a Viewing Party" button should take the user to the new viewing party page
      # (/users/:user_id/movies/:movie_id/viewing-party/new),
      visit user_movie_path(@user, @movie.id)

      expect(page).to have_content(find_button("Create").text)
    end

    it "has a button to return to the Discover Page", :vcr do
      visit user_movie_path(@user, @movie.id)

      expect(page).to have_button "Discover Page"
    end
  end

  # US Movies Details Page
  # Movie Title
  # Vote Average of the movie
  # Runtime in hours & minutes
  # Genre(s) associated to movie
  # Summary description
  # List the first 10 cast members (characters&actress/actors)
  # Count of total reviews
  # Each review's author and information
  # NOTE: The above information should come from 3 different endpoints from The Movie DB API.
  describe "movie details" do
    it "shows all the details", :vcr do
      visit user_movie_path(@user, @movie.id)

      expect(page).to have_content "Overview"
      expect(page).to have_content @movie.cast.join(", ")
      expect(page).to have_content @movie.genres.join(", ")
    end
  end
end
