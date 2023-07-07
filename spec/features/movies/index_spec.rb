# When I visit the discover movies page,
# and click on either the Top Movies button or the Search button,
# I should be taken to the movies results page (users/:user_id/movies) where I see:

#  Title (As a Link to the Movie Details page)
#  Vote Average of the movie
# Details: There should only be a maximum of 20 results. The above details should be listed for each movie.

# I should also see a button to return to the Discover Page.
require 'rails_helper'

RSpec.describe 'Movies Index Page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Sarah', email: 'sarah@gmail.com')
    @user2 = User.create!(name: 'Jimmy', email: 'jimmy@gmail.com')
  end
  describe 'As a user, when I visit the Discover Movies page and I click on Top Movies or Search button' do
    it 'displays the title and vote average for the top 20 movies' do
      # VCR.use_cassette('movies_index') do
        # json_response = File.read('spec/fixtures/movie_index.json')
        # stub_request(:get, "https://api.themoviedb.org/3/search/movie?query=batman").
        #   to_return(status: 200, body: json_response)
  
        visit discover_path(@user1)
  
        fill_in :search, with: 'Batman'
        click_button 'Search'
  
        expect(current_path).to eq(movies_path(@user1))
        expect(page.status_code).to eq(200)
        expect(page).to have_content('Batman')
        expect(page).to have_css(".movie", count: 20)
        expect(page).to_not have_css(".movie", count: 21)
      # end
    end

    it 'has a button to return to the Discover Page' do
      visit movies_path(@user1)

      expect(page).to have_button('Discover Page')

      click_on('Discover Page')

      expect(current_path).to eq(discover_path(@user1))
    end

    it "Top Movies Button is clicked and taken to the movies results page" do
      visit discover_path(@user1)

      click_button("Discover Top Rated Movies")

      expect(current_path).to eq(movies_path(@user1))

      expect(page).to have_content("The Godfather")
    end
  end
end

