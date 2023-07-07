require "rails_helper"

RSpec.describe MovieService do
  describe "search" do
    it "returns search results by movie title", :vcr do
      movie_service = MovieService.new

      princess_movies = movie_service.search("Princess")[:results]

      expect(princess_movies).to be_an(Array)
    end
  end
end