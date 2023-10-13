require 'rails_helper'

RSpec.describe 'Movies Results Page' do
  describe 'When I visit the user discover page', :vcr do
    before :each do
      @user1 = User.create(name: 'Joe', email: 'joeiscool@yahoo.com')
    end
    
    it 'page has movie results; title, vote average, details' do 
      visit user_discover_index_path(@user1)
      fill_in "Search", with: "Up"
      click_button("Search")

      expect(page).to have_current_path("/users/#{@user1.id}/movies?search=Up&commit=Search")
      expect(page).to have_content("20 Results")
      expect(page).to have_content("Movie Title: ")
      expect(page).to have_content("Movie Vote Average: ")
      expect(page).to have_content("Movie Overview: ")
    end

    xit 'has a button to return to the Discover Page' do 
      visit user_movies_path(@user1)

      expect(page).to have_link("Discover Page")
    end
  end
end
