# frozen_string_literal: true

require 'rails_helper'

describe 'Movies Results Index Page' do
  before :each do
    @user1 = User.create!(name: 'JoJo', email: 'JoJo@hotmail.com')
    @user2 = User.create!(name: 'JaJa', email: 'JaJa@hotmail.com')
  end

  describe 'Page Display', :vcr do
    it 'has application title' do
      visit "/users/#{@user1.id}/discover"
      click_on 'Find Top Rated Movies'

      expect(page).to have_content('Viewing Party')
    end

    it 'displays discover movies button' do
      visit "/users/#{@user1.id}/discover"
      click_on 'Find Top Rated Movies'

      expect(page).to have_button('Return to Discover')
    end

    it 'discover button redirects back to user discover page' do
      visit "/users/#{@user1.id}/discover"
      click_on 'Find Top Rated Movies'
      click_button('Return to Discover')

      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end
  end

  feature 'top 20 results display' do
    scenario 'displays 20 movies', :vcr do
      visit "/users/#{@user1.id}/discover"

      click_on 'Find Top Rated Movies'
      @movies = SearchFacade.new({ type: 'top_rated' }).movies
      expect(current_path).to eq("/users/#{@user1.id}/movies")

      expect(page).to have_content('Movie Title', count: 20)
      expect(page).to have_content('Vote Average:', count: 20)
      expect(@movies.count).to eq(20)
    end
  end

  feature 'movie search results display' do
    scenario 'displays 0-20 movies based on search input- example kill', :vcr do
      visit "/users/#{@user1.id}/discover"

      fill_in :movie, with: 'Kill'
      click_on 'Find Movies'
      @movies = SearchFacade.new({ movie: 'Kill' }).movies

      expect(page).to have_content('Movie Title', count: 20)
      expect(page).to have_content('Vote Average:', count: 20)
      expect(@movies.count).to eq(20)
    end

    scenario 'displays 0-20 movies based on search input- example Pulp Fiction', :vcr do
      visit "/users/#{@user1.id}/discover"

      fill_in :movie, with: 'Pulp Fiction'
      click_on 'Find Movies'
      @movies = SearchFacade.new({ movie: 'Pulp Fiction' }).movies

      expect(page).to have_content('Movie Title', count: 7)
      expect(page).to have_content('Vote Average:', count: 7)
      expect(@movies.count).to eq(7)
    end
  end
end
