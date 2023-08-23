require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    it '.top_rated_movies' do
      response = MovieService.top_rated_movies
      
      expect(response).to be_a Hash
      expect(response[:results]).to be_an Array
      
      response[:results].each do |movie|
        expect(movie).to have_key :original_title
        expect(movie[:original_title]).to be_a String
        expect(movie).to have_key :vote_average
        expect(movie[:vote_average]).to be_a Float
      end
    end
  end
end