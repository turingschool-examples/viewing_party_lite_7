require "rails_helper"

RSpec.describe "Movie Factory" do
  describe "class methods" do
    before(:each) do
      @movies = []
    end

    describe "::make_movie" do
      it "makes a movie poro based on the data available at the initial landing", :vcr do
        movies = MovieFactory.get_top_rated

        expect(movies).to be_an Array
        expect(movies.first).to be_a Movie
        expect(movies.first.title).to eq "The Godfather"
      end
    end

    describe "::add_details" do
      it "takes a movie poro and adds details from additional api call", :vcr do
        movie = MovieFactory.get_top_rated.first

        MovieFactory.add_details(movie)

        expect(movie.runtime).not_to be_nil
        expect(movie.genres).to eq %w[Drama Crime]
      end
    end
  end
end
