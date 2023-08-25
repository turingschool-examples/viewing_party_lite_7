# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Discover Movies', type: :feature do
  describe 'Movies Results Page ' do
    scenario 'i visit the discover movie page and click either button then im redirected and see api data', :vcr do
      VCR.use_cassette('i visit the discover movie page and click either button then im redirected and see api data') do
        json_response = File.read('spec/fixtures/movie_results.json')
        stub_request(:get, 'https://api.themoviedb.org/3/discover/movie.json')
          .to_return(status: 200, body: json_response)
        u1 = User.create!(name: 'Sean', email: 'champion4lyfe@gmail.com')

        visit user_discover_index_path(u1)

        expect(page).to have_button('Discover Top Rated Movies')
        expect(page).to have_button('Search by Movie Title')

        click_button('Discover Top Rated Movies')

        expect(current_path).to eq(user_movies_path(u1))
      end
    end

    scenario 'search by movie title' do
      VCR.use_cassette('search by movie title') do
        json_response = File.read('spec/fixtures/movie_results.json')
        stub_request(:get, 'https://api.themoviedb.org/3/discover/movie.json')
          .to_return(status: 200, body: json_response)
        u1 = User.create!(name: 'Sean', email: 'champion4lyfe@gmail.com')

        visit user_discover_index_path(u1)

        fill_in :search_by_similar_word, with: 'Barbie'

        click_button('Search by Movie Title')
        expect(page).to have_content('Your search result = Barbie, Vote Average: 7.4')
      end
    end
  end
end
