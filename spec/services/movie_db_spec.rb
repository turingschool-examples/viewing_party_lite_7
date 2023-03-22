require 'rails_helper'

describe MoviedbService do
  describe "instance methods" do
    describe "#top_rated_movies" do
      it "returns a list of 20 movies and their data" do
        VCR.use_cassette("top_rated_movies") do
          @movies = MoviedbService.new.top_rated_movies
        end
        expect(@movies).to be_a Hash
        expect(@movies[:results]).to be_an Array
        expect(@movies[:results].count).to eq 20
        movie_data = @movies[:results].first
        movie_data_2 = @movies[:results].second

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)

        expect(movie_data[:vote_average]).to be <= movie_data_2[:vote_average]
      end
    end
  end
end