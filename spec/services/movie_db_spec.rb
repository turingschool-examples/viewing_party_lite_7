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

    describe "#search_results" do
      it "returns movies that match the keyword search" do
        VCR.use_cassette("search_results") do
          @searched_movies = MoviedbService.new.search_results("Despicable")
        end

        expect(@searched_movies).to be_a Hash
        expect(@searched_movies[:results]).to be_an Array
        expect(@searched_movies[:results].count).to be <= 20

        expect(@searched_movies[:results].first[:original_title]).to include("Despicable")
      end

      it "returns nil if no movies match the keyword search" do
        VCR.use_cassette("bad_search_results") do
          @searched_nothing = MoviedbService.new.search_results("tobacco and worms for breakfast")
        end

        expect(@searched_nothing).to be_a Hash
        expect(@searched_nothing[:results].first).to be nil
      end
    end
  end
end