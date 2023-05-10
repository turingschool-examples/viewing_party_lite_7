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
  end
end