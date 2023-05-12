require 'rails_helper'

RSpec.describe MovieListFacade, :vcr do
  describe 'initialize' do
    it 'exists' do
      @movie_list_facade = MovieListFacade.new('Movie')

      expect(@movie_list_facade).to be_a(MovieListFacade)
    end
  end

  describe 'search' do
    it 'returns an array of movie objects' do
      movie_list_facade = MovieListFacade.new('King')
      movies = movie_list_facade.search

      expect(movies).to be_an(Array)
      expect(movies).to all(be_a(Movie))
      expect(movies.count).to be <= 20
    end

    it 'can return an array of objects with less than 20 results' do
      movie_list_facade = MovieListFacade.new('Princess Peach')
      movies = movie_list_facade.search

      expect(movies).to be_an(Array)
      expect(movies).to all(be_a(Movie))
      expect(movies.count).to eq(1)
      expect(movies.count).to be <= 20
    end
  end

  describe 'top_rated' do
    it 'returns an array of movie objects' do
      movie_list_facade = MovieListFacade.new('top rated')
      movies = movie_list_facade.top_rated

      expect(movies).to be_an(Array)
      expect(movies).to all(be_a(Movie))
      expect(movies.count).to be <= (20)
    end
  end

  describe 'get_movies' do
    it 'returns top rated movies' do
      movie_list_facade = MovieListFacade.new('top rated')

      movies = movie_list_facade.get_movies
      movies2 = movie_list_facade.top_rated

      expect(movies).to be_an(Array)
      expect(movies).to all(be_a(Movie))
      expect(movies.first.title).to eq(movies2.first.title)
      expect(movies.last.title).to eq(movies2.last.title)
    end

    it 'returns searched movies' do
      movie_list_facade = MovieListFacade.new('princess')

      movies = movie_list_facade.get_movies
      movies2 = movie_list_facade.search

      expect(movies).to be_an(Array)
      expect(movies).to all(be_a(Movie))
      expect(movies.first.title).to eq(movies2.first.title)
      expect(movies.last.title).to eq(movies2.last.title)
    end
  end
end