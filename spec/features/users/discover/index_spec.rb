require 'rails_helper'

RSpec.describe 'Discover Index Page' do
  describe 'As a registered user' do
    it 'I visit the discover index page' do
      visit user_dashboard_discover_index_path(@user1)

      expect(page).to have_content('Viewing Party')
      expect(page).to have_content('Discover Movies')
      expect(page).to have_link('Home')
    end
    it 'I can see a button to discover top rated movies' do
      visit user_dashboard_discover_index_path(@user1)
      click_link 'Top Rated Movies'
    end
  end
end
