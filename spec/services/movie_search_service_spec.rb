
require 'rails_helper'

RSpec.describe MovieSearchService, type: :service do
  describe '#movie_search' do
    it 'returns the search results for a given search term' do
      search_term = 'Star Wars'
      expected_url = "/3/search/movie?query=#{search_term}"
      expect(subject).to receive(:get_url).with(expected_url)
      subject.movie_search(search_term)
    end
  end
  describe '#conn' do
    it 'connects' do
      service = MovieSearchService.new
      conn = service.conn
      expect(conn.url_prefix.to_s).to eq('https://api.themoviedb.org/')
      expect(conn.params['api_key']).to eq(Rails.application.credentials.tmdb[:key])
    end
  end
  describe 'get url' do
    it 'gets a url' do
      VCR.use_cassette('movie search') do
        service = MovieSearchService.new
        search_term = 'Star Wars'
        expect(service.get_url("/3/search/movie?query=#{search_term}")).to be_a Hash
      end
    end
  end
end
