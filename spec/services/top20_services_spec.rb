require 'rails_helper'

RSpec.describe Top20Service, type: :service do
  describe '#movie_search' do
    it 'returns the top20 url' do
      expected_url = '/3/movie/top_rated'
      expect(subject).to receive(:get_url).with(expected_url)
      subject.top20
    end
  end
  describe '#conn' do
    it 'connects' do
      service = Top20Service.new
      conn = service.conn
      expect(conn.url_prefix.to_s).to eq('https://api.themoviedb.org/')
      expect(conn.params['api_key']).to eq(Rails.application.credentials.tmdb[:key])
    end
  end
end
