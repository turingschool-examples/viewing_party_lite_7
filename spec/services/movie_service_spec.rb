require 'rails_helper'

describe MovieService do
  describe "class methods" do
    describe "movies" do
      it "returns movie data" do
        movies = MovieService.new.movies
        movie = movies.first

        expect(movies).to be_a Array
        expect(movie).to be_a Hash

        expect(movie).to have_key :name
        expect(movie[:name]).to be_a(String)

        expect(movie).to have_key :date
        expect(movie[:date]).to be_a(String)
      end
    end
  end
end