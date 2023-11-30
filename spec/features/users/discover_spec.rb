require 'rails_helper'

RSpec.describe 'Discover Movies' do
  describe 'visiting the Discover Movies page (/users/:id/discover)' do
    
    it 'has a button to "Discover Top Rated Movies" and a form to search by movie title' do
      user = User.last
      visit "/users/#{user.id}/discover"
      expect(page).to have_button('Discover Top Rated Movies')
      expect(page).to have_field(:movie_title)
      expect(page).to have_button('Search by Movie Title')
    end
    it 'redirects to the movie results page when a user searches for a move, or clicks the discover button' do
      
    end
  end
end
