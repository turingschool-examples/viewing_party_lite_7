require 'rails_helper'

describe MovieService do
  describe "#top_rated_movies" do
    before(:each) do
      @top_rated_movies = MovieService.new.top_rated_movies
    end
    
    it "returns all expected attributes and data types" do
      expect(@top_rated_movies).to be_a(Array)

      expect(@top_rated_movies.first).to have_key(:id)
      expect(@top_rated_movies.first[:id]).to be_a(Integer)

      expect(@top_rated_movies.first).to have_key(:title)
      expect(@top_rated_movies.first[:title]).to be_a(String)

      expect(@top_rated_movies.first).to have_key(:vote_average)
      expect(@top_rated_movies.first[:vote_average]).to be_a(Float)
    end

    it "returns the top 20 rated moves" do
      expect(@top_rated_movies.count).to eq(20)
      expect(@top_rated_movies.first[:title]).to eq("The Godfather")
      expect(@top_rated_movies.first[:vote_average]).to eq(8.7)
    end
  end
end