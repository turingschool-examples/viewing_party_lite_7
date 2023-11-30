require "rails_helper"
require_relative "../../app/facades/movie_factory"

RSpec.describe "Movie Facade" do
  describe "class methods" do
    before(:each) do
      @movies = []
    end

    describe "::get_top_rated" do
      it "makes a movie poros for given api call", :vcr do
        movies = MovieFacade.get_top_rated

        expect(movies).to be_an Array
        expect(movies.first).to be_a Movie
        expect(movies.first.title).to eq "The Godfather"
      end
    end

    describe "::add_details" do
      it "takes a movie poro and adds details from additional api call", :vcr do
        movie = MovieFacade.get_top_rated.first

        MovieFacade.add_details(movie)

        expect(movie.runtime).not_to be_nil
        expect(movie.genres).to eq %w[Drama Crime]
      end
    end
  end
end
