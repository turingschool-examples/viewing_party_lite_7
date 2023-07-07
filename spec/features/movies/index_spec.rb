require "rails_helper" 

RSpec.describe "Discover Movies Page", type: :feature do 
  before(:each) do 
    @user1 = User.create!(name: "Wolfie", email: "wolfie@gmail.com")

    top_rated_response = File.read("spec/fixtures/discover_top_rated_movies.json")
    stub_request(:get, "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["TMDB-KEY"]}&include_adult=false&page=1&sort_by=popularity.desc").
        with(
          headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.9'
          }).
        to_return(status: 200, body: top_rated_response, headers: {})

    keyword_response = File.read("spec/fixtures/keyword_movie_jaws.json")
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV["TMDB-KEY"]}&include_adult=false&page=1&query=Jaws").
        with(
          headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.9'
          }).
        to_return(status: 200, body: keyword_response, headers: {})
        
    visit "/users/#{@user1.id}/discover"
  end

  describe "discovery links that route to users/:user_id/movies" do 
    it "button to discover top rated movies" do 
      click_button "Discover Top Rated Movies"

      expect(page.status_code).to eq 200
      expect(page).to have_content("Knights of the Zodiac")
      expect(current_path).to eq("/users/#{@user1.id}/movies")
    end

    it "a text field to search by title with search button" do 
      fill_in "keyword", with: "Jaws"
      click_button "Search"

      expect(page.status_code).to eq 200
      expect(page).to have_content("Jaws")
      expect(current_path).to eq("/users/#{@user1.id}/movies")
    end
  end
end