require 'rails_helper'

RSpec.describe MovieDbService do
  it 'searches for movies' do
    VCR.use_cassette('movie_search') do
      data = MovieDbService.search_movies('Star Wars')

      expect(data).to be_a(Hash)
      expect(data[:results]).to be_an(Array)
      expect(data[:results].first[:title]).to be_a(String)
    end
  end

  it 'retrieves movie details' do
    VCR.use_cassette('movie_details') do
      data = MovieDbService.movie_details(11)

      expect(data).to be_a(Hash)
      expect(data[:title]).to eq('Star Wars')
    end
  end
end
