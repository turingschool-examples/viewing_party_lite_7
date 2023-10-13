require 'rails_helper'

RSpec.describe "Discover Index page", type: :feature do
  describe "When I visit the discover index page" do
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
  end
end