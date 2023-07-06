require 'rails_helper'

describe MovieService do
  describe 'class methods' do
    describe '#top_movies' do
      it 'returns the top 20 movies' do
        movies = MovieService.new.top_rated_movies
        results = movies[:results]

        expect(results).to be_an(Array)
        expect(results.count).to eq(20)

        expect(results.first).to have_key(:title)
        expect(results.first[:title]).to be_a(String)

        expect(results.first).to have_key(:vote_average)
        expect(results.first[:vote_average]).to be_a(Float)
      end
    end

    describe '#search_movies' do
      it 'returns the movies that matched the search' do
        movies = MovieService.new.search_movies('Pulp Fiction')
        results = movies[:results]

        expect(results).to be_an(Array)
        expect(results.count).to eq(7)

        expect(results.first).to have_key(:title)
        expect(results.first[:title]).to be_a(String)
        expect(results.first[:title]).to include('Pulp Fiction')

        expect(results.first).to have_key(:vote_average)
        expect(results.first[:vote_average]).to be_a(Float)
      end

      it 'returns an empty array if no movies matched the search' do
        movies = MovieService.new.search_movies('bruhbruhbruh')
        results = movies[:results]
        
        expect(results).to eq([])
        expect(results.count).to eq(0)
      end
    end
  end
end