require 'rails_helper'

describe MovieService do
  before :each do
    oppenheimer_test_data
  end

  context "instance methods" do
    context "#popular_movies" do
      it "returns popular movie data" do
        popular = MovieService.new.popular_movies
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

    context "#search_movies" do
      it "returns movies that match search criteria" do
        search = MovieService.new.search_movies("Trolls")
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

    context "get_url" do
      it "returns parsed json data" do
        url = "movie/popular"
        parsed_response = MovieService.new.get_url(url)
        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:results]).to be_an(Array)
      end
    end

    context "#conn" do
      it "returns Faraday object" do
        service = MovieService.new
        expect(service.conn).to be_a(Faraday::Connection)
      end
    end
  end
end