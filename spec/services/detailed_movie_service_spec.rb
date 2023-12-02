require 'rails_helper'

describe DetailedMovieService do
  before :each do
    oppenheimer_test_data
  end

  context "#detailed_movie" do
    it "returns a single detailed movi data from movie details endpoint" do
      movie = DetailedMovieService.new.detailed_movie(872585)
      expect(movie).to be_a Hash

      expect(movie).to have_key :title
      expect(movie[:title]).to be_a String

      expect(movie).to have_key :vote_average
      expect(movie[:vote_average]).to be_a Float

      expect(movie).to have_key :id
      expect(movie[:id]).to be_an Integer

      expect(movie).to have_key :runtime
      expect(movie[:runtime]).to be_a Integer

      expect(movie).to have_key :genres
      expect(movie[:genres]).to be_an Array

      expect(movie).to have_key :overview
      expect(movie[:overview]).to be_a String
    end
  end
end