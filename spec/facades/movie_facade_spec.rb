require "rails_helper"

describe MovieFacade do
  describe "class methods" do
    describe ".get_top_rated_movies" do
      it "returns an array of movies", :vcr do
        movies = MovieFacade.get_top_rated_movies

        expect(movies).to be_an Array
        expect(movies.count).to eq(20)
        movies.each do |movie|
          expect(movie).to be_a Movie
        end
      end
    end
  end

end