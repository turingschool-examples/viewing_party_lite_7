require 'rails_helper'

RSpec.describe 'Discover Movies' do
  describe 'visiting the Discover Movies page (/users/:id/discover)' do
    it 'has a button to "Discover Top Rated Movies" and a form to search by movie title' do
      user = User.last
      visit "/users/#{user.id}/discover"
      expect(page).to have_button('Find Top Rated Movies')
      expect(page).to have_field(:query)
      expect(page).to have_button('Find Movies')
    end
  end
  describe 'clicking the Discover Top Rated Movies button' do
    it 'redirects to the movie results', :vcr do
      user = User.last
      visit "/users/#{user.id}/discover"
      click_button 'Find Top Rated Movies'
      expect(current_path).to eq("/users/#{user.id}/movies")
    end
  end
  describe 'searching for Movies by title', :vcr do
    it 'redirects to the movie results page' do
      user = User.last
      visit "/users/#{user.id}/discover"
      fill_in :query, with: 'Barbie'
      click_button 'Find Movies'
      expect(current_path).to eq("/users/#{user.id}/movies")
    end
  end
end
