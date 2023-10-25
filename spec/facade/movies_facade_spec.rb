# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe MoviesFacade do
  context 'initialize' do
    it 'exists with an argument' do
      expect(MoviesFacade.new(268)).to be_an Object
    end

    it 'exists without an argument' do
      expect(MoviesFacade.new).to be_an Object
    end
  end

  context 'class methods' do
    context '#movie_search' do
      it 'returns movie objects from keyword search', :vcr do
        search = MoviesFacade.new.movie_search('dog')
        expect(search).to be_a Object
        movie = search.first

        expect(movie.title).to be_a String
        expect(movie.id).to be_an Integer
        expect(movie.vote_average).to be_a Float
      end
    end

    context '#movie_discover' do
      it 'returns movie objects from top twenty movies', :vcr do
        search = MoviesFacade.new.movie_discover
        expect(search).to be_a Object
        movie = search.first

        expect(movie.title).to be_a String
        expect(movie.id).to be_an Integer
        expect(movie.vote_average).to be_a Float
      end
    end

    context '#movie' do
      it 'returns movie object from movie id', :vcr do
        movie = MoviesFacade.new(268).movie
        expect(movie).to be_a Object

        expect(movie.title).to be_a String
        expect(movie.summary).to be_a String
        expect(movie.image_url).to be_a String
        expect(movie.genres).to be_a String
        expect(movie.vote_average).to be_a Float
        expect(movie.runtime).to be_an Integer
      end
    end

    context '#cast' do
      it 'returns cast object from movie id', :vcr do
        casts = MoviesFacade.new(268).cast
        expect(casts).to be_a Object
        cast = casts.first

        expect(cast.character).to be_a String
        expect(cast.name).to be_a String
      end
    end

    context '#reviews' do
      it 'returns review object from movie id', :vcr do
        reviews = MoviesFacade.new(268).reviews
        expect(reviews).to be_a Object
        review = reviews.first

        expect(review.author).to be_a String
        expect(review.content).to be_a String
        expect(review.rating).to be_an Integer
        expect(review.total_results).to be_an Integer
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
