require 'rails_helper'

RSpec.describe 'Movie Search' do
  describe 'movie search' do
    it 'allows user to search for Senators by last name' do
      json_response = File.read('spec/fixtures/movie_search.json')
      stub_request(:get, "https://api.themoviedb.org/3/discover/movie").
        to_return(status: 200, body: json_response)
      visit root_path
    end
  end
end