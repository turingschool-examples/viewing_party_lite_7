require 'rails_helper'

describe MovieSearchService do
  before :each do
    oppenheimer_test_data
  end

  context "#search_movies" do
    it "returns movies data that match search criteria" do
      search = MovieSearchService.new.search_movies("Trolls")
      expect(search).to be_a Hash
      expect(search[:results]).to be_an Array
      movie_data = search[:results].first

      expect(movie_data).to have_key :original_title
      expect(movie_data[:original_title]).to be_a String

      expect(movie_data).to have_key :vote_average
      expect(movie_data[:vote_average]).to be_a Float

      expect(movie_data).to have_key :id
      expect(movie_data[:id]).to be_a Integer
    end
  end
end