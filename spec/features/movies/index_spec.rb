# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'movies results page' do
  before(:each) do
    @user_1 = create(:user)
  end

  describe 'visiting movies results page' do
    before(:each) do
      visit user_discover_index_path(@user_1)
    end

    it 'top movies button goes to results page' do
      click_on 'Discover Top Rated Movies'
      expect(current_path).to eq(user_movies_path(@user_1))
    end

    it 'movies results page lists top movies if top movies button clicked' do
      click_on 'Discover Top Rated Movies'
      expect(page).to have_css('.top-rated')

      within '.top-rated' do
        expect(page).to have_css('.movie', count: 20)
      end

      within(first('.movie')) do
        expect(page).to have_css('.title')
        expect(page).to have_css('.average_vote')
        # expect(page).to have_content('The Godfather')
      end
    end

    xit 'movies results page lists relevant movies if search button clicked' do
      fill_in(:movie_search, with: 'neverending')
      click_button 'Find Movies'
      expect(page).to have_css('.search_results')
      within '.search_results' do
        expect(page).to have_css('.movie', count: 20)
      end

      within(first('.movie')) do
        expect(page).to have_css('.title')
        expect(page).to have_css('.average_vote')
        # expect(page).to have_content('The NeverEnding Story')
      end
    end
  end

  describe 'movies results page content' do
    before(:each) do
      visit user_movies_path(@user_1)
    end

    xit 'title of movie is link to movie details page'

    xit 'vote average of movie is listed below movie title'

    xit 'has a button to return to Discover page' do
      expect(page).to have_button('Discover Page')
      click_button 'Discover Page'
      expect(current_path).to eq(user_discover_index_path(@user_1))
    end
  end
end
