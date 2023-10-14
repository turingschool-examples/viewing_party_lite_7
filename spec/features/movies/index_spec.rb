require 'rails_helper'

RSpec.feature 'User Movies Index Page', type: :feature do
  let(:weston) { User.create(name: 'Weston', email: 'will@weston.com') }

  before { visit discover_user_path(weston) }

  describe 'Happy Path' do
    context 'when viewing top-rated movies' do
      before do
        click_button 'Discover Top Rated Movies'
      end

      it 'displays 20 of the most popular movies', :vcr do
        expect(current_path).to eq(user_movies_path(weston))
        expect(page).to have_content('The Godfather')
        expect(page).to have_content(8.7)
        expect(page).to have_selector('table tbody tr', count: 20)
      end
    end

    context 'when searching for a movie' do
      before do
        fill_in :query, with: 'The Matrix'
        click_button 'Search'
      end

      it 'displays 20 movies of the search query', :vcr do
        expect(current_path).to eq(user_movies_path(weston))
        expect(page).to have_content('The Matrix')
        expect(page).to have_selector('table tbody tr', count: 20)
      end
    end
  end

  describe 'Sad Path' do
    context 'when no search query is provided' do
      before { click_button 'Search' }

      it 'redirects to the discovery path', :vcr do
        expect(current_path).to eq(discover_user_path(weston))
      end
    end

    context 'when no movies are found' do
      before do
        fill_in :query, with: 'asdlfkjasdlfkjasdlfkj'
        click_button 'Search'
      end

      it 'displays a no movies found message and redirects', :vcr do
        expect(current_path).to eq(discover_user_path(weston))
        expect(page).to have_content('No movies found.')
      end
    end
  end
end
