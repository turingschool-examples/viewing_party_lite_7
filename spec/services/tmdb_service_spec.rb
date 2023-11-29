require "rails_helper"
require_relative "../../app/services/tmdb_service"

RSpec.describe TMDBService do
  context "class methods" do
    context "#top_rated" do
      it "returns top movies", :vcr do
        movies = TMDBService.new.top_rated
        expect(movies).to be_a Hash
        expect(movies[:results]).to be_an Array
        movie_data = movies[:results].first

        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)

        expect(movie_data).to have_key :genre_ids
        expect(movie_data[:genre_ids]).to be_a(Array)

        expect(movie_data).to have_key :overview
        expect(movie_data[:overview]).to be_a(String)

        expect(movie_data).to have_key :poster_path
        expect(movie_data[:poster_path]).to be_a(String)
      end
    end
  end
end
