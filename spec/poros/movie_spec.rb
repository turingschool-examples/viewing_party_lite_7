require 'rails_helper'

RSpec.describe Movie do
  describe 'creates movie object' do
    it 'has attributes' do
      movie = Movie.new({ id: 1, original_title: 'The Movie', vote_average: 10.58 })

      expect(movie).to be_a Movie
      expect(movie.title).to be_a String
      expect(movie.title).to eq('The Movie')
      expect(movie.vote_average).to be_a Float
      expect(movie.vote_average).to eq(10.58)
    end
  end
end