require "rails_helper"

RSpec.describe MovieFacade do
  describe "top rated movies", :vcr do
    it "returns top rated movies" do
      movie_facade = MovieFacade.new
      movies = movie_facade.top_rated

      expect(movies).to be_an(Array)
      expect(movies.first).to be_a(Movie)
    end
  end
end