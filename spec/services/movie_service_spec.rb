require 'rails_helper'

RSpec.describe MovieService do
  describe 'movie_search' do
    it 'returns a list of movies', :vcr do
      search = MovieService.new.search_movies('Batman')
      expect(search).to be_a(Hash)
      expect(search[:results]).to be_an(Array)
      movie_data = search[:results].first

      expect(movie_data).to have_key(:title)
      expect(movie_data[:title]).to be_a(String)
    end
  end
end