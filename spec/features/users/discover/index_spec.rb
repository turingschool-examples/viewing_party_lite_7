require 'rails_helper'

RSpec.describe 'Discover Movies Page', type: :feature do
  describe 'User Story #8',:vcr do
    before(:each) do
      @user1 = User.create!(name: 'John Doe', email: 'johndoe@yahoo.com')
    end

    it 'exists' do
      visit user_discover_path(@user1)

      expect(current_path).to eq(user_discover_path(@user1))
    end

    it 'has a button to discover top 20 movies' do
      visit user_discover_path(@user1)

      within('#find-movies-button') do
        expect(page).to have_button('Find Top Rated Movies')
      end
    end

    it 'takes user to movies index with top 20 movies when button is clicked' do
      visit user_discover_path(@user1)

      within('#find-movies-button') do
        click_button 'Find Top Rated Movies'
      end

      expect(current_path).to eq(user_movies_path(@user1))
      
      within('#movies') do
        expect(page).to have_content('The Godfather')
      end
    end

    it 'has a button to discover movies by search' do
      visit user_discover_path(@user1)

      within('#movie-search') do
        expect(page).to have_field('search')
        expect(page).to have_button('Find Movies')
      end
    end

    it 'takes user to movies index with movies by keyword when button is clicked' do
      visit user_discover_path(@user1)

      within('#movie-search') do
        fill_in 'search', with: 'Lock, Stock and Two Smoking Barrels'
        click_button 'Find Movies'
      end

      expect(current_path).to eq(user_movies_path(@user1))
      expect(page).to have_content('Lock, Stock and Two Smoking Barrels')
      expect(page).to_not have_content('The Godfather')
    end
  end
end