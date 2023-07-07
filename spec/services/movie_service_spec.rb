require 'rails_helper'

RSpec.describe MovieService do 
  before(:each) do 
    @ms = MovieService.new
  end

  describe 'initialize' do 
    it 'exists' do 
      expect(@ms).to be_a MovieService
    end
  end

  describe 'class methods', :vcr do 
    it '#conn' do 
      response = @ms.conn
      expect(response).to be_a Faraday::Connection
    end

    it '#get_url' do 
      response = @ms.get_url('movie/top_rated')
      expect(response).to be_a Hash
      expect(response[:results]).to be_a Array

      movie_data = response[:results].first

      expect(movie_data).to have_key(:title)
      expect(movie_data[:title]).to be_a String

      expect(movie_data).to have_key(:vote_average)
      expect(movie_data[:vote_average]).to be_a Float
    end

    it '#top_movies' 

    it '#search_movies'
  end
end