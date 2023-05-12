require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'methods' do
    it 'top_20_movies', :vcr do
      movie = MovieFacade.new.top_20_movies

      expect(movie).to be_an(Array)
      expect(movie.count).to eq(20)
      expect(movie).to all(be_a(Movie))
    end

    it 'search_movies', :vcr do
      movie = MovieFacade.new.search_movies('The Matrix')

      expect(movie).to be_an(Array)
      expect(movie).to all(be_a(Movie))
    end
  end
end