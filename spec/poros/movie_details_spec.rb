require 'rails_helper'

RSpec.describe MovieDetails do
  describe "initialize" do
    it "has attributes" do
      movie_details_attributes = {
        id: 123,
        title: "Test",
        overview: "This is a test overview",
        vote_average: "68%",
        runtime: 123,
        poster_path: "Test/path",
        genres: [
          { name: "test1" },
          { name: "test2" }
        ],

      }
      movie_details = MovieDetails.new(movie_details_attributes)

      expect(movie_details.id).to eq(movie_details_attributes[:id])
      expect(movie_details.title).to eq(movie_details_attributes[:title])
      expect(movie_details.overview).to eq(movie_details_attributes[:overview])
      expect(movie_details.vote_average).to eq(movie_details_attributes[:vote_average])
      expect(movie_details.runtime).to eq(movie_details_attributes[:runtime])
      expect(movie_details.poster_path).to eq(movie_details_attributes[:poster_path])
      expect(movie_details.genres).to eq(movie_details_attributes[:genres].map { |genre| genre[:name]})
    end
  end

  describe "#formatted_runtime" do
    it "converts the time to hours and minutes" do
      movie_details_attributes = {
        id: 123,
        title: "Test",
        overview: "This is a test overview",
        vote_average: "68%",
        runtime: 123,
        poster_path: "Test/path",
        genres: [
          { name: "test1" },
          { name: "test2" }
        ],

      }
      movie_details = MovieDetails.new(movie_details_attributes)

      expect(movie_details.formatted_runtime).to eq("2 hours 3 minutes")
    end
  end
end