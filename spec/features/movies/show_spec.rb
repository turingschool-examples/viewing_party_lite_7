require 'rails_helper'

RSpec.describe 'Movie Detail Page', type: :feature do 
  before(:each) do 
    @user_1 = create(:user)
    @top_movies = MovieFacade.new.top_movies
    @movie = @top_movies.first

    visit "/users/#{@user_1.id}/movies/#{@movie.id}"
  end

  describe 'movie details' do 
    it 'displays title' do 
      expect(page).to have_content('The Godfather')
    end
  end

  describe 'buttons' do
    it 'has button to discover movies' do
      visit user_discover_index_path(@user_1)
      expect(page).to have_button('Discover Top Rated Movies')
      click_on 'Discover Top Rated Movies'
      expect(current_path).to eq(user_movies_path(@user_1))
    end

    it 'has button to new viewing party page' do
      visit user_discover_index_path(@user_1)
      expect(page).to have_button('New Viewing Party')
      click_button('New Viewing Party')
      expect(current_path).to eq("/users/#{@user_1.id}/movies/#{@movie.id}/viewing-party/new")
    end
  end
end