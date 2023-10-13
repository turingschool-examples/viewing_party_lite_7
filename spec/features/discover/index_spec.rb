require 'rails_helper'

RSpec.describe "Discover Index page", type: :feature do
  describe "top rated movies", :vcr do
    before(:each) do
      @user_1 = User.create!(name: "Kiwi", email: "kiwibird@gmail.com")

      visit "/users/#{@user_1.id}/discover"
    end

    it "the page exists" do
      expect(page).to have_current_path("/users/#{@user_1.id}/discover")
    end

    it 'has button to discover top rated movies' do
      expect(page).to have_button('Find Top Rated Movies')
    end

    it 'has a search field and button to find relevant movies' do
      within('#search-movies') do
        expect(page).to have_field(:search)
        expect(page).to have_button('Search')
      end
    end

    it 'top rated movie results' do
      click_link 'Find Top Rated Movies'

      expect(page).to have_link('The Godfather')
      expect(page).to have_content('Vote Average')
    end

    it 'when the user clicks on Find Movies, they should be taken to the movies results page' do
      fill_in :search, with: 'Harry Potter'
      click_on 'Search'
      expect(page).to have_content("Harry Potter and the Philosopher's Stone")
    end

    it 'also has a button to return to the Discover Page' do
      click_link 'Find Top Rated Movies'
      expect(page).to have_button('Discover Page')

      click_on 'Discover Page'
      expect(page).to have_current_path(user_discover_index_path(@user_1))

      fill_in :search, with: 'Harry Potter'
      click_on 'Search'
      expect(page).to have_button('Discover Page')

      click_on 'Discover Page'
      expect(page).to have_current_path(user_discover_index_path(@user_1))
    end
  end
end
