# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Movie Results Page '/users/:id/movies'", type: :feature do
  before(:each) do
    @user_1 = User.create!(name: 'Jimmy', email: 'movie_buff333@gmail.com')
    @user_2 = User.create!(name: 'Timmy', email: 'i_hate_movies@gmail.com')
    @user_3 = User.create!(name: 'Tammy', email: 'gamer4134@gmail.com')
  end

  describe 'top rated movies' do
    it 'displays top rated movies', :vcr do
      visit discover_path(@user_1.id)
      click_button('Find Top Rated Movies')

      expect(page).to have_content('Top Rated Movies')
      within '#top_movies' do
        expect(current_path).to eq(movies_path)
        expect(page).to have_link('The Godfather')
        expect(page).to have_content('Vote Average: 8.7')
      end
    end
  end
end
