# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'creates movie facade' do
    it 'returns top rated movies', :vcr do
      movies = MovieFacade.top_movies

      expect(movies).to be_a Array
      expect(movies.first).to be_a Movie
      expect(movies.first.title).to be_a String
      expect(movies.count).to eq(20)
    end

    it 'returns top rated movies from search query', :vcr do
      movies = MovieFacade.search_movies_by_title('Jack')

      expect(movies).to be_a Array
      expect(movies.first).to be_a Movie
      expect(movies.first.title).to be_a String
      expect(movies.count).to eq(20)
    end

    it 'returns movie by id', :vcr do
      movie = MovieFacade.get_movie(5)

      expect(movie).to be_a Movie
      expect(movie.title).to be_a String
    end

    it 'returns cast and characters for movie', :vcr do
      movie_cast = MovieFacade.get_cast(25)

      expect(movie_cast).to be_a Array
      expect(movie_cast.count).to eq(10)
      movie_cast.each do |cast|
        expect(cast).to be_a String
      end
    end

    it 'returns reviews for movie', :vcr do
      movie_reviews = MovieFacade.get_reviews(569_094)
      expect(movie_reviews).to be_a Array
      expect(movie_reviews.first.author).to be_a String
      expect(movie_reviews.first.content).to be_a String
    end

    it 'returns count of reviews for movie', :vcr do
      movie_reviews_count = MovieFacade.count_reviews(569_094)

      expect(movie_reviews_count).to be_a Integer
    end
  end
end
