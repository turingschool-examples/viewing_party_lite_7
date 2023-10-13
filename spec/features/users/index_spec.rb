# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the users_:id_discover page', type: :feature do
  describe 'When a user visits the discover path' do
    before :each do
      @user = User.create!(name: 'John Smith', email: 'jsmith@aol.com')

      visit user_discover_path(@user)
    end

    it 'has a button to find top rated movies, a text field to enter keywords, a button to search by movie title based on keywords' do
      expect(page).to have_button('Discover Top Rated Movies')
      expect(page).to have_field(:search)
      expect(page).to have_button('Search by Movie Title')
    end

    it 'when the user clicks on the Discover Top Rated Movies button they are taken to users_:id_movies', :vcr do
      click_button 'Discover Top Rated Movies'

      expect(current_path).to eq(user_movies_path(@user))
    end

    it 'when the user fills in the search field and clicks on the Search by Movie Title button, they are taken to users_:id_movies',
       :vcr do
      fill_in :search, with: 'Shawshank Redemption'
      click_button 'Search by Movie Title'

      expect(current_path).to eq(user_movies_path(@user))
    end
  end
end
