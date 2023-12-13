require 'rails_helper'

RSpec.describe MoviesService, type: :service do
  describe 'Movie Service Instance Methods', :vcr do
    it "#conn, returns a faraday object" do
      service = MoviesService.new

      expect(service.conn).to be_a(Faraday::Connection)
    end

    it "#get_url, returns hash data" do
      url = "/3/movie/top_rated"
      top_rated = MoviesService.new.get_url(url)

      expect(top_rated).to be_a(Faraday::Response)
    end

    it "#top_rated_20, returns parsed json data" do
      search_results = MoviesService.new.top_rated_20

      expect(search_results).to be_a(Hash)
      expect(search_results[:results]).to be_a(Array)
    end

    it "#movie, returns parsed json data" do
      search_results = MoviesService.new.movie(238)

      expect(search_results).to be_a(Hash)
      expect(search_results[:genres]).to be_a(Array)
    end

    it "#cast, returns parsed json data" do
      search_results = MoviesService.new.cast(238)

      expect(search_results).to be_a(Hash)
      expect(search_results[:cast]).to be_a(Array)
    end

    it "#reviews, returns parsed json data" do
      search_results = MoviesService.new.reviews(238)

      expect(search_results).to be_a(Hash)
      expect(search_results[:results]).to be_a(Array)
    end
  end
end
