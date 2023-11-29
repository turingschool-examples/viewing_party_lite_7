require 'rails_helper' 

describe 'Dashboard: Discover Movies' do
  before :each do
    test_data

    popular_movies_fixture = File.read("spec/fixtures/popular_movies.json")
    stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=#{ENV["API_KEY"]}").
    with(
      headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'=>'Faraday v2.7.12'
      }).
    to_return(status: 200, body: popular_movies_fixture, headers: {})

  end

  describe 'Top-Rated Movies' do
    it 'has the title as a link to movie details page' do

      visit user_path(@user1)
      click_button "Discover Movies"
      click_button "Discover Top Rated Movies"
      expect(page).to have_content("Vote Average:")
      expect(page).to have_link("The Super Mario Bros. Movie")
    end

    it "has the vote average of the movie" do

      visit user_path(@user1)
      click_button "Discover Movies"
      click_button "Discover Top Rated Movies"

      expect(page).to have_content("Vote Average: 7.747")
    end

    it "has 20 results" do

      visit user_path(@user1)
      click_button "Discover Movies"
      click_button "Discover Top Rated Movies"
      expect(current_path).to eq(user_results_path(@user1))

      expect(page).to have_content("20 Results")

    end

    it "has a button to return to the discover page" do

      visit user_path(@user1)
      click_button "Discover Movies"
      click_button "Discover Top Rated Movies"
      expect(page).to have_button("Return to Discover Page")

      click_button("Return to Discover Page")

      expect(current_path).to eq(user_discover_index_path(@user1))
    end
  end

  describe 'Movie Search' do
    xit "has a link that will go to the movie show page" do
      visit user_discover_index_path(@user1)
      click_button "Search by Movie Title"
      click_link "The Creator"

      creator_movie = Movie.all.find{|m| m.id == "The Creator"}
      expect(current_path).to eq(user_movie_path(@user1, creator_movie.id))
    end
  end
end
