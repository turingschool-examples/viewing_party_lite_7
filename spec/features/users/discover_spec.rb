require 'rails_helper'

RSpec.describe 'Discover Movies' do
  describe 'visiting the Discover Movies page (/users/:id/discover)' do
    it 'has a button to "Discover Top Rated Movies" and a form to search by movie title' do
      user = User.last
      visit "/users/#{user.id}/discover"
      expect(page).to have_button('Find Top Rated Movies')
      expect(page).to have_field(:search)
      expect(page).to have_button('Find Movies')
    end
  end
end
