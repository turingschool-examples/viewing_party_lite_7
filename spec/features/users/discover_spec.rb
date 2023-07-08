require "rails_helper"

RSpec.describe "User Discover" do
  describe "user discover movies path" do
    before :each do
      @user1 = FactoryBot.create(:user)

      json_response = File.read('spec/fixtures/tmdb_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/popular").
        to_return(status: 200, body: json_response)
      visit user_discover_index_path(@user1.id)
    end

    it "has button to discover movies" do
      expect(page).to have_button "Discover Top Rated Movies"
      click_button "Discover Top Rated Movies"
      expect(current_path).to eq user_movies_path(@user1.id)
    end

    it "can search for movies with keywords" do
      expect(page).to have_field "keyword"
      expect(page).to have_button "submit"
    end
  end

  describe "user movie search results page" do
    before :each do
      @user1 = FactoryBot.create(:user)

      json_response = File.read('spec/fixtures/tmdb_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/popular").
        to_return(status: 200, body: json_response)
      visit user_discover_index_path(@user1.id)
    end

    it "top movies page return to discover movies page button" do
      click_button "Discover Top Rated Movies"
      expect(page).to have_button "Discover Movies"
      click_button "Discover Movies"
      expect(current_path).to eq user_discover_index_path(@user1.id)
    end

    it "top movies page" do
      click_button "Discover Top Rated Movies"
      within "#movies" do
        expect(page.status_code).to eq 200
        expect(page).to have_content("Title: Knights of the Zodiac")
        expect(page).to have_content("Vote Average: 6.5")
        expect(page).to have_link "Knights of the Zodiac"
      end
    end
  end

  describe "user movie search results page" do
    before :each do
      @user1 = FactoryBot.create(:user)

      json_response = File.read('spec/fixtures/movies_search.json')
      stub_request(:get, "https://api.themoviedb.org/3/search/movie?query=Sandlot").
        to_return(status: 200, body: json_response)
      visit user_discover_index_path(@user1.id)
    end
    
    it "user search movies button" do
      fill_in "keyword", with: 'Sandlot'
      click_button "submit"
      expect(page).to have_content("Title: The Sandlot")
      expect(page).to have_content("Vote Average: 7.517")
    end
  end
end