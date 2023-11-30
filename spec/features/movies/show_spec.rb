require "rails_helper"

RSpec.describe "Movie details page", type: :feature do
  # US Movies Details Page
  # When I visit a movie's detail page (/users/:user_id/movies/:movie_id) where :id is a valid user id,
  # I should see
  #
  # a button to Create a Viewing Party
  # a button to return to the Discover Page
  # I should also see the following information about the movie:
  describe "available interfaces" do
    it "has a button to create a Viewing Party" do
      # Details
      # The "Create a Viewing Party" button should take the user to the new viewing party page
      # (/users/:user_id/movies/:movie_id/viewing-party/new),
      
    end

    it "has a button to return to the Discover Page" do

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
    it "shows all the details" do

    end
  end
end
