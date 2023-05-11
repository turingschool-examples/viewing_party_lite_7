# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user story 9' do
  describe 'movie results page' do
    before(:each) do
      @user1 = User.create(name: 'Bob', email: 'bob@email.com')
      @user2 = User.create(name: 'Sally', email: 'sally@email.com')
    end

    it 'displays top 20 movie titles', :vcr do
      visit user_movie_index_path(@user1)
      save_and_open_page
      within '#movie-1' do
        expect(page).to have_content('The Godfather')
      end

      within "#movie-20" do
        expect(page).to have_content('GoodFellas')
      end

      within "#movie-17" do
        expect(page).to have_content('The Lord of the Rings: The Return of the King')
      end
    end

    it 'displays vote average of top 20 movies', :vcr do
      visit user_movie_index_path(@user1)

      within '#movie-1' do
        expect(page).to have_content(8.7)
      end

      within '#movie-20' do
        expect(page).to have_content(8.5)
      end

      within '#movie-17' do
        expect(page).to have_content(8.5)
      end
    end

    it 'has movie title as a link' do
      
    end

    it 'has button to return to discover page', :vcr do
      visit user_movie_index_path(@user1)

      within '#discover-button' do
        expect(page).to have_button('Back to Discover')
        click_button 'Back to Discover'
      end
      expect(current_path).to eq(user_discover_index_path(@user1))
    end
  end
end
