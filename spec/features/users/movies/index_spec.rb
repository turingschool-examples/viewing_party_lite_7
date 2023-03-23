require 'rails_helper'

RSpec.describe "/users/:id/movies", type: :feature do
  describe "as a user, when I visit the movie index page" do 
    before :each do
      @picard = User.create!(name: "Jean-Luc Picard", email: "captain@uss-enterprise.com")
    end

    # User Story 6
    it "can search for movie name, redirect here, & display the first 20 top movies & vote average" do
      top_movies = File.read("spec/fixtures/moviedb/top_movies.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?include_adult=false")
      .to_return(status: 200, body: top_movies, headers: {})

      visit "/users/#{@picard.id}/discover"
      click_button("Find Top Rated Movies")
      expect(current_path).to eq("/users/#{@picard.id}/movies")

      expect(page).to have_content("Top Rated Movies")
      expect(page).to have_button("Discover Page")

      within "#top-238" do
        expect(page).to have_content("The Godfather")
        expect(page).to have_content("Vote Average: 8.7")
      end

      within "#top-680" do
        expect(page).to have_content("Pulp Fiction")
        expect(page).to have_content("Vote Average: 8.5")
      end

      expect(page).to have_content("Vote Average:", count: 20)
    end
  
    # # User Story 6
    # it "can search for movie name, redirect here, & display display max 20 movies with those keywords & vote average" do
    #   search_results = File.read("spec/fixtures/moviedb/search_results.json")
    #   stub_request(:get, "https://api.themoviedb.org/movie/top_rated")
    #   .to_return(status: 200, body: search_results, headers: {})
      
    #   visit "/users/#{@picard.id}/discover"
    #   fill_in(:search, with: "2001: A Space Odyssey")
    #   click_button("Search by Movie Title")
    #   expect(current_path).to eq("/users/#{@picard.id}/movies")

    #   expect(page).to have_content("Movie Results for: 2001: A Space Odyssey")
    #   expect(page).to have_button("Discover Page")

    #   expect(page).to have_content("2001: A Space Odyssey")
    #   expect(page).to have_content("Vote Average: 9")

    #   expect(page).to have_content("Vote Average:", count: 1)
    # end

    # User Story 6
    it "can search for partial keywords, redirect here, & display max 20 movies with those keywords & vote average" do
      search_results = File.read("spec/fixtures/moviedb/search_results.json")
        stub_request(:get, "https://api.themoviedb.org/search/movie?include_adult=false&query=space%20od")
        .to_return(status: 200, body: search_results, headers: {})

      visit "/users/#{@picard.id}/discover"
      fill_in(:search, with: "space od")
      click_button("Search by Movie Title")
      expect(current_path).to eq("/users/#{@picard.id}/movies")

      expect(page).to have_content("Movie Results for: space od")
      expect(page).to have_button("Discover Page")

      within "#top-62" do
        expect(page).to have_content("2001: A Space Odyssey")
        expect(page).to have_content("Vote Average: 8.083")
      end
      
      within "#top-443295" do
        expect(page).to have_content("Bowie2001- A Space Oddity")
        expect(page).to have_content("Vote Average: 0.0")
      end
    end      
  end
end

