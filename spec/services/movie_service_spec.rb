require "rails_helper"

RSpec.describe MovieService do
  describe '#top_20_flicks' do
    it 'returns a list of top movies, 20 per page' do
      data = MovieService.top_20_flicks
      expect(data[:results].count).to eql(20)
      expect(data[:results].first).to be_a(Hash)
      expect(data[:results].first).to have_key(:title)
      expect(data[:results].first[:title]).to eq('The Godfather')
    end
  end

  describe 'movie_search' do
    it 'can search for a movie' do
      data = MovieService.movie_search("Spider")
      expect(data[:results].first).to be_a(Hash)
      expect(data[:results].first).to have_key(:title)
      expect(data[:results].first[:title]).to eq('Spider')
    end
  end
end