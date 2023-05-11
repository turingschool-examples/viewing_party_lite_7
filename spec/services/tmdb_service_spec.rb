require 'rails_helper'

RSpec.describe 'TmdbService', :vcr do
  describe 'top_rated_movies' do
    it 'returns the top 20 rated movies' do
      @tmdb_service = TmdbService.new.top_rated_movies
      expect(@tmdb_service[:results]).to be_an(Array)
      expect(@tmdb_service[:results].count).to eq(20)
    end
  end

  describe 'movie_search' do
    it "returns movies that match the search term" do
      @tmdb_service = TmdbService.new.movie_search('ocean')
      expect(@tmdb_service[:results]).to be_an(Array)
      
      first_result = @tmdb_service[:results].first
      expect(first_result).to have_key(:title)
      expect(first_result[:title]).to be_a(String)
    end
  end
end