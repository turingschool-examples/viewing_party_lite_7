require "rails_helper"

RSpec.describe MovieService do
  describe "movie service", :vcr do 
    it "returns top rated movies" do
      movie_service = MovieService.new
      top_rated_movies = movie_service.top_rated[:results]
      
      expect(top_rated_movies).to be_an(Array)
      expect(top_rated_movies.count).to eq(20)
    end
  end
end