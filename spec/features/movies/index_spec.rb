# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the users_:id_movies page', type: :feature do
  describe 'When a user visits the movies page' do
    before :each do
      @user = User.create!(name: 'John Smith', email: 'jsmith@aol.com')

      visit user_discover_path(@user)
    end

    it 'has a button to return to the Discover Page', :vcr do
      click_button 'Discover Top Rated Movies'

      expect(current_path).to eq("/users/#{@user.id}/movies")

      expect(page).to have_button('Discover Page')

      click_button 'Discover Page'

      expect(current_path).to eq("/users/#{@user.id}/discover")
    end

    it 'displays the top rated movies when visited from the Discover Top Rated Movies button', :vcr do
      click_button 'Discover Top Rated Movies'

      expect(current_path).to eq("/users/#{@user.id}/movies")

      within('#movie-238') do
        expect(page).to have_content('The Godfather')
        expect(page).to have_content('Vote Average 8.7')
      end
    end
  end
end
