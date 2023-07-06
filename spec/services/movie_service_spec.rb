require 'rails_helper'

describe MovieService do
  describe 'class methods' do
    describe '#top_movies' do
      it 'returns the top 20 movies' do
        movies = MovieService.new.top_rated_movies
        top_movies = movies[:results]

        expect(top_movies).to be_an(Array)
        expect(top_movies.count).to eq(20)

        expect(top_movies.first).to have_key(:title)
        expect(top_movies.first[:title]).to be_a(String)

        expect(top_movies.first).to have_key(:vote_average)
        expect(top_movies.first[:vote_average]).to be_a(Float)
      end
    end
  end
end