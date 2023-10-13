# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade, test: :model do
  it 'exists' do
    mv = MovieFacade.new('3/configuration')

    expect(mv).to be_a MovieFacade
  end

  describe 'instance methods' do
    it '#movie', :vcr do
      mv = MovieFacade.new('3/movie/238?language=en-US')

      expect(mv.movie.id).to eq(238)
      expect(mv.movie.title).to eq('The Godfather')
      expect(mv.movie.img).to eq('/3bhkrj58Vtu7enYsRolD1fZdja1.jpg')
      expect(mv.movie.vote_average).to eq(8.708)
      expect(mv.movie.runtime).to eq(175)
      expect(mv.movie.genres).to eq([{ "id": 18, "name": 'Drama' }, { "id": 80, "name": 'Crime' }])
      expect(mv.movie.summary).to eq('Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.')
      expect(Movie.movie).to be_a Movie
      expect(mv.movie.find_genres).to eq('Drama, Crime')
      expect(mv.movie.find_runtime).to eq('2h 55mins')
    end

    it '#movies', :vcr do
      query = MovieFacade.new('3/search/movie?query=The Godfather&include_adult=false&language=en-US&page=1')
      top_rated = MovieFacade.new('3/movie/top_rated?language=en-US&page=1')

      expect(query.movies).to be_an Array
      expect(query.movies[0]).to be_a Hash
      expect(query.movies[0]).to have_key :original_title
      expect(query.movies[0]).to have_key :overview
      expect(query.movies[0]).to have_key :poster_path
      expect(query.movies[0]).to have_key :vote_average
      expect(top_rated.movies).to be_an Array
      expect(top_rated.movies.count).to eq(20)
      expect(top_rated.movies[0]).to be_a Hash
      expect(top_rated.movies[0]).to have_key :original_title
      expect(top_rated.movies[0]).to have_key :overview
      expect(top_rated.movies[0]).to have_key :poster_path
      expect(top_rated.movies[0]).to have_key :vote_average
    end

    it '#cast', :vcr do
      mv = MovieFacade.new('3/movie/238/credits?language=en-US')

      expect(mv.cast).to be_an Array
      expect(mv.cast.count).to eq(10)
      expect(mv.cast[0]).to be_a Hash
      expect(mv.cast[0]).to have_key :character
      expect(mv.cast[0]).to have_key :name
    end

    it '#reviews', :vcr do
      mv = MovieFacade.new('3/movie/238/reviews?language=en-US')

      expect(mv.reviews).to be_an Array
      expect(mv.reviews[0]).to be_a Hash
      expect(mv.reviews[0]).to have_key :author
      expect(mv.reviews[0]).to have_key :content
    end

    it '#image', :vcr do
      mv = MovieFacade.new('3/configuration')

      expect(mv.image).to be_a Hash
      expect(mv.image).to have_key :base_url
      expect(mv.image).to have_key :backdrop_sizes
    end
  end
end
