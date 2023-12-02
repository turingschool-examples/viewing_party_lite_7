require "rails_helper"
require_relative "../../app/facades/movie_facade"

RSpec.describe "Movie Facade" do
  describe "class methods" do
    before(:each) do
      @movies = []
    end

    describe "::get_top_rated" do
      it "makes a movie poros for given api call", :vcr do
        movies = MovieFacade.get_top_rated

        expect(movies).to be_an Array
        expect(movies.first).to be_a Poro::Movie
        expect(movies.first.title).to eq "The Godfather"
      end
    end

    describe "::movie_search" do
      it "returns the queried movies", :vcr do
        movies = MovieFacade.movie_search("fastball")

        expect(movies).to be_an Array
        expect(movies.first).to be_a Poro::Movie
        expect(movies.first.title.downcase).to include "fastball"
      end
    end
  end
end
