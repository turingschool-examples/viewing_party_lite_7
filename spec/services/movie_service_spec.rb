require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    it 'top_rated_movies' do
      @response = MovieService.top_rated_movies
      @movies = @response[:results]

      expect(@movies).to be_a(Array)
      expect(@movies.count).to eq(20)
      expect(@movies.first[:title]).to eq("The Godfather")
    end

    it 'movie_search' do
      @response = MovieService.movie_search("The Fellowship of the ring")
      @movies = @response[:results]

      expect(@movies).to be_a(Array)
      expect(@movies.first[:title]).to eq("The Lord of the Rings: The Fellowship of the Ring")

      @response2 = MovieService.movie_search("The")
      @movies2 = @response2[:results]
      
      expect(@movies2.count).to eq(20)
    end

    it 'cast' do
      @response = MovieService.cast(238)
      @cast = @response[:cast]

      expect(@cast).to be_a(Array)
      expect(@cast.count).to eq(59)
    end

    it 'reviews' do
      @response = MovieService.reviews(238)
      @reviews = @response[:results]

      expect(@reviews).to be_a(Array)
      expect(@reviews.count).to eq(3)
    end
  end
end