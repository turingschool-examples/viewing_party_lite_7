require 'rails_helper'

describe MovieService do
  describe "#top_rated_movies" do
    it "returns the top 20 rated moves" do
      top_rated_movies = MovieService.new.top_rated_movies

      expect(top_rated_movies).to be_a(Array)
      expect(top_rated_movies.count).to eq(20)
      expect(top_rated_movies.first[:title]).to eq("The Godfather")
      expect(top_rated_movies.first[:vote_average]).to eq(8.7)
    end
  end
end