require 'rails_helper' 

describe 'Movie Details Page' do
  before :each do
    test_data

    popular_movies_fixture = File.read("spec/fixtures/popular_movies.json")
    stub_request(:get, "https://api.themoviedb.org/3/movie/popular").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12',
          'X-Api-Key'=>ENV["API_KEY"]
           }).
         to_return(status: 200, body: popular_movies_fixture, headers: {})
    
    visit user_discover_index_path(@user1)
    click_button "Search by Movie Title"
    click_link "The Creator"

    @creator_movie = Movie.all.find{|m| m.title == "The Creator"}
    save_and_open_page
  end

  describe 'buttons' do
    it 'has a button to create a new viewing party' do
      expect(page).to have_button("Create a Viewing Party")
    end

    it 'has a button to return to the Discover Page' do
      expect(page).to have_button("Return to Discover Page")
    end
  end

  describe 'details' do
    it "has all of the required details listed about the movie" do
      expect(page).to have_content("The Creator")
      expect(page).to have_content("Vote: #{@creator.vote_average}")
      expect(page).to have_content("Runtime: ")
      expect(page).to have_content("Genre: ")
      expect(page).to have_content("Summary ")
      expect(page).to have_content("Cast ")
      expect(page).to have_content("Reviews ")
      expect(page).to have_content("Runtime: ")
      expect(page).to have_content("Runtime: ")
    end
  end


end