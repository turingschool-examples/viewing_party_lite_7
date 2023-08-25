require 'rails_helper'

RSpec.describe Movie do
  describe "initialize" do
    it "has attributes" do
      movie_attributes = {
        id: 123,
        title: "Test Movie",
        overview: "This is a test movie.",
        vote_average: 7.5
      }
      movie = Movie.new(movie_attributes)

      expect(movie.id).to eq(movie_attributes[:id])
      expect(movie.title).to eq(movie_attributes[:title])
      expect(movie.overview).to eq(movie_attributes[:overview])
      expect(movie.vote_average).to eq(movie_attributes[:vote_average])
    end
  end
end