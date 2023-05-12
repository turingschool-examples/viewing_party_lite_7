require 'rails_helper'

describe MovieService do
  describe "class methods" do
    describe "movies" do
      it "returns movie data", :vcr do
        movies = MovieService.new.movies("query")[:results]
        movie = movies.first

        expect(movies).to be_a Array
        expect(movie).to be_a Hash

        expect(movie).to have_key :title
        expect(movie[:title]).to be_a(String)

        expect(movie).to have_key :id
        expect(movie[:id]).to be_a(Integer)
      end
    end

    describe "top_movies" do
      it "returns the top rated movies", :vcr do
        movies = MovieService.new.top_movies[:results]
        movie = movies.first

        expect(movies).to be_a Array
        expect(movie).to be_a Hash

        expect(movie).to have_key :title
        expect(movie[:title]).to be_a(String)

        expect(movie).to have_key :id
        expect(movie[:id]).to be_a(Integer)
      end
    end
  end
end
