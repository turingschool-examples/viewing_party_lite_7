require 'rails_helper'

describe 'User Discover page' do
  describe "When I visit the '/users/:id/discover' path, where :id, is the id of a valid user," do
    it "I should see a Button to 'Discover Top Rated Movies', A text field to enter keyword(s) to search by movie title, and A Button to 'Search by Movie Title'" do
      VCR.use_cassette('themoviedb') do
        user = create(:user)
        visit "/users/#{user.id}/discover"
        
        expect(page).to have_button("Discover Top Rated Movies")
        expect(page).to have_css("#keyword_search")
        expect(page).to have_button("Search by Movie Title")
      end
    end
    
    it "And click on either the Top Movies button or the Search button, I should be taken to the movies results page (users/:user_id/movies) where I see: 'Title' (As a Link to the Movie Details page) and 'Vote Average' of the movie" do
      VCR.use_cassette('themoviedb') do
        user = create(:user)
        visit "/users/#{user.id}/discover"
        click_button("Discover Top Rated Movies")
        
        expect(current_path).to eq("/users/#{user.id}/movies")
        expect(page).to have_button("Discover Page")
        expect(page).to have_css('.movie_title', count: 20)
        
        visit "/users/#{user.id}/discover"
        fill_in "keyword_search", with: "Princess"
        click_button("Search by Movie Title")
        
        expect(current_path).to eq("/users/#{user.id}/movies")
        found_count = page.all('.movie_title').count
        expect(found_count).to be <= 20

        save_and_open_page
        
        click_on "Discover Page"
        
        expect(current_path).to eq("/users/#{user.id}/discover")
      end
    end
  end
end