require 'rails_helper'

RSpec.describe 'User Movies Index Page', type: :feature do
  before do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'Top Rated Movies', :vcr do
    it "After clicking on Top Rated Movies button from Discover Page,
        I should see headers and links" do
      visit dashboard_discover_path
      movie = MovieService.new.top_rated_movies.first
      # require 'pry'; binding.pry
      click_link 'Top Rated Movies'

      expect(current_path).to eq(dashboard_movies_path)

      expect(page).to have_content('Viewing Party')
      expect(page).to have_link('Home')
      expect(page).to have_link('Discover Movies')
      expect(page).to have_content('Top Rated Movies')
      expect(page).to have_content('Title')
      expect(page).to have_content('Rating')
      click_on "The Godfather"
      expect(current_path).to eq(dashboard_movies_path(movie[:id]))
    end
  end

  describe 'Search Movies', :vcr do
    it 'After entering a search term and clicking on Find Movies button' do
      visit dashboard_discover_path
      fill_in :q, with: 'The Matrix'
      click_on 'Find Movies'

      expect(current_path).to eq(dashboard_movies_path)
      expect(page).to have_content('Viewing Party')
      expect(page).to have_link('Home')
      expect(page).to have_link('Discover Movies')
      expect(page).to have_content('The Matrix')
      expect(page).to have_content('Rating')
      expect(page).to have_content('Title')
      click_on "The Matrix"
    end
  end
end
