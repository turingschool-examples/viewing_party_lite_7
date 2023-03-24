require 'rails_helper'

RSpec.describe "/users/:user_id/movies/:movie_id" do
  describe "as a user, when I visit a movie's show page" do 
    before :each do
      @picard = User.create!(name: "Jean-Luc Picard", email: "captain@uss-enterprise.com")
    end

    it "displays the movie information" do
      movie_response = File.read("spec/fixtures/moviedb/space_odyssey.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/62?api_key=#{ENV["TMDB_API_KEY"]}")
      .to_return(status: 200, body: movie_response, headers: {})
        
      cast_response = File.read("spec/fixtures/moviedb/space_cast.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/62/credits?api_key=#{ENV["TMDB_API_KEY"]}")
      .to_return(status: 200, body: cast_response, headers: {})

      reviews_response = File.read("spec/fixtures/moviedb/space_reviews.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/62/reviews?api_key=#{ENV["TMDB_API_KEY"]}")
      .to_return(status: 200, body: reviews_response, headers: {})
      film = MoviedbFacade.new(movie_id: 62)

      visit "/users/#{@picard.id}/movies/62"

      expect(page).to have_content("2001: A Space Odyssey")
      expect(page).to have_button("Discover Page")
      expect(page).to have_button("Create Viewing Party for 2001: A Space Odyssey")
      expect(page).to have_content("Vote: 8.083")
      expect(page).to have_content("Runtime: 149(MINUTES -> HOURS MIN)")
      expect(page).to have_content("Genre: Science Fiction, Mystery, Adventure")

      expect(page).to have_content("Summary")
      expect(page).to have_content("Humanity finds a mysterious object buried beneath the lunar surface and 
        sets off to find its origins with the help of HAL 9000, the world's most advanced super computer.")

      expect(page).to have_content("Cast")
      expect(page).to have_content("Keir Dullea as Dr. David Bowman")
      expect(page).to have_content("Frank Miller as Mission Controller")

      expect(page).to have_content("7 Reviews")
      expect(page).to have_content("markuspm: There are many great predictions hinting to future (it is from 1968 
        - can you believe it?) innovations throughout the movie. I might not have found all them because I keep 
        falling asleep while watching it but I will keep trying to find them all.")
    end
  end
end