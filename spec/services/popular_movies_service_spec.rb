require 'rails_helper'

describe PopularMoviesService do
  before :each do
    oppenheimer_test_data
  end

  context "#popular_movies" do
    it "returns popular movie data" do
      popular = PopularMoviesService.new.popular_movies
      expect(popular).to be_a Hash
      expect(popular[:results]).to be_an Array
      movie_data = popular[:results].first

      expect(movie_data).to have_key :original_title
      expect(movie_data[:original_title]).to be_a String

      expect(movie_data).to have_key :vote_average
      expect(movie_data[:vote_average]).to be_a Float

      expect(movie_data).to have_key :id
      expect(movie_data[:id]).to be_a Integer
    end
  end
end