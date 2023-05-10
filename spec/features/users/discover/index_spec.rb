require 'rails_helper'

RSpec.describe 'Discover Movies Page' do
  describe 'when I visit the users/:id/discover page' do
    before(:each) do
      @user1 = User.create(name: 'Bob', email: 'bob@email.com')
      @user2 = User.create(name: 'Sally', email: 'sally@email.com')
      visit user_discover_index_path(@user1)
    end

    it 'I see a button to discover top rated movies' do
      expect(page).to have_content('Discover Movies Page')
      within '#top-rated' do
        expect(page).to have_button('Discover Top Rated Movies')

        click_button('Discover Top Rated Movies')
      end
      expect(current_path).to eq(user_movie_index_path(@user1))
      expect(page).to have_content('Movies Results Page')
    end

    it 'I see a search field to search for movies' do
      within '#search-movie' do
        expect(page).to have_field(:search)
      end
    end
  end
end