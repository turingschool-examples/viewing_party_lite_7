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

    describe "find_movie" do
      it "returns movie details for given movie id", :vcr do
        movie = MovieService.new.find_movie(550)

        expect(movie).to be_a Hash

        expect(movie).to have_key :title
        expect(movie[:title]).to be_a(String)

        expect(movie).to have_key :id
        expect(movie[:id]).to be_a(Integer)
      end
    end

    describe "credits" do
      it "returns credits for given movie id", :vcr do
        credits = MovieService.new.credits(550)

        expect(credits).to be_a Hash

        expect(credits).to have_key(:cast)
        expect(credits[:cast]).to be_a(Array)

        expect(credits[:cast][0]).to have_key(:name)
        expect(credits[:cast][0]).to be_a(Hash)
      end
    end
  end
end
