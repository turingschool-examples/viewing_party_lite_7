require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do
  describe 'Create a new viewing party', :vcr do

    it 'I can create a new viewing party' do
      user1 = create(:user)
      movie = MovieService.new.top_rated_movies.first
      movie_details = MovieService.new.full_movie_details(movie[:id])
      
      visit new_user_dashboard_movie_viewing_party_path(user1, movie[:id])
      
      expect(page).to have_content('Viewing Party')
      expect(page).to have_link('Home')
      expect(page).to have_link('Discover Movies')
      expect(page).to have_content('Movie Title')
      expect(page).to have_content(movie[:title])
      expect(page).to have_content('Duration of Movie')
      expect(page).to have_content(movie[:runtime])
      expect(page).to have_content('Day')
      expect(page).to have_field('day')
      expect(page).to have_content('Start Time')
      expect(page).to have_field('start_time')
      expect(page).to have_cotent('Invite Other Users')
      expect(page).to have_button('Create Party')
    end
  end
end