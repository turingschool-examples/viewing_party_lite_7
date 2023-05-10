require 'rails_helper'

RSpec.describe TmbdService do
  describe 'Establish connection' do
    it 'can retreive a list of the top 20 movies', :vcr do
      top_movies = TmbdService.top_rated_movies

      expect(top_movies).to be_a(Hash)
      expect(top_movies[:results]).to be_an(Array)
      expect(top_movies[:results].first[:title]).to be_a(String)
      expect(top_movies[:results].count).to eq(20)

      movie = top_movies[:results].first

      expect(movie).to have_key(:id)
      expect(movie).to have_key(:title)
      expect(movie).to have_key(:vote_average)
    end

    it 'can retrieve a list of search results' do
      VCR.use_cassette('search_movies_tremors') do
        search_movies = TmbdService.search_movies('Tremors')

        expect(search_movies).to be_a(Hash)
        expect(search_movies[:results]).to be_an(Array)
        expect(search_movies[:results].first[:title]).to be_a(String)
        expect(search_movies[:results].first[:title]).to eq('Tremors')

        movie = search_movies[:results].first

      expect(movie).to have_key(:id)
      expect(movie).to have_key(:title)
      expect(movie).to have_key(:vote_average)
      end
    end
  end
end