require 'rails_helper'

RSpec.describe 'Discover Index Page' do
  before(:each) do
    visit user_dashboard_discover_index_path(@user1)
  end

  describe 'As a registered user', :vcr do
    it 'I visit the discover index page' do
      expect(page).to have_content('Viewing Party')
      expect(page).to have_content('Discover Movies')
      expect(page).to have_link('Home')
    end

    it 'I can see a button to discover top rated movies' do
      expect(page).to have_link('Top Rated Movies')

      click_link 'Top Rated Movies'

      expect(current_path).to eq(user_dashboard_movies_path(@user1))
    end
  end
end
