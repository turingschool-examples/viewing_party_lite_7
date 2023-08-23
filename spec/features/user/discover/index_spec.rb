require 'rails_helper'

RSpec.describe 'Discover Movies', type: :feature do
  describe 'Movies Results Page ' do
    scenario "i visit the discover movie page and click either button then im redirected and see api data" do 
      json_response = File.read('spec/fixtures/movie_results.json')
      stub_request(:get, "https://api.themoviedb.org/3/discover/movie.json").
      to_return(status: 200, body: json_response)
      u1 = User.create!(name: "Sean", email: "champion4lyfe@gmail.com")

      visit user_discover_index_path(u1)

      expect(page).to have_button("Discover Top Rated Movies")
      expect(page).to have_button("Search by Movie Title")

      click_button("Discover Top Rated Movies")
      
      expect(current_path).to eq(user_movies_path(u1))
      
      visit user_discover_index_path(u1)

      fill_in :"search_by_similar_word", with: "Barbie"
      click_button("Search by Movie Title")
      
      
      expect(current_path).to eq(user_movies_path(u1))
    end
  end
end