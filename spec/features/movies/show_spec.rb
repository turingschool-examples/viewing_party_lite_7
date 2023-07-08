require "rails_helper"

RSpec.describe "Movie Details Page", type: :feature do
  before(:each) do
    lotr_details = File.read("./spec/fixtures/lord_of_the_rings_fellowship/details.json")
    lotr_credits = File.read("./spec/fixtures/lord_of_the_rings_fellowship/credits.json")
    lotr_reviews = File.read("./spec/fixtures/lord_of_the_rings_fellowship/reviews.json")

    @movie = Movie.new(JSON.parse(lotr_details, symbolize_names: true))

    @user = User.create!(name: "John", email: "john@example.com")

    # This stubs out the API call to the movie details endpoint
    stub_request(:get, "https://api.themoviedb.org/3/movie/120?api_key=#{ENV['MOVIE_API_KEY']}")
    .to_return(status: 200, body: lotr_details)

    # This stubs out the API call to the movie credits endpoint
    stub_request(:get, "https://api.themoviedb.org/3/movie/120/credits?api_key=#{ENV['MOVIE_API_KEY']}")
    .to_return(status: 200, body: lotr_credits)

    stub_request(:get, "https://api.themoviedb.org/3/movie/120/reviews?api_key=#{ENV['MOVIE_API_KEY']}")
    .to_return(status: 200, body: lotr_reviews)
  end

  describe "when I visit the movie details page" do
    context "Happy Path" do
      before(:each) do
        visit user_movie_path(@user, 120)
      end

      it "displays a link to the home page, 'Viewing Party', and the movie's title at the top of the page" do
        expect(page).to have_link("Home")
        expect(page).to have_content("Viewing Party")

        within("#title") do
          expect(page).to have_content(@movie.title)
        end
      end

      it "displays a button that takes the user back to the discover page" do
        within("#buttons") do
          expect(page).to have_button("Discover Page")

          click_button("Discover Page")
        end

        expect(current_path).to eq(user_discover_index_path(@user))
      end

      it "displays a button that takes user to a page to create a viewing party" do
        within("#buttons") do
          expect(page).to have_button("Create Viewing Party for #{@movie.title}")

          click_button("Create Viewing Party for #{@movie.title}")
        end

        expect(current_path).to eq(new_user_movie_viewing_party_path(@user.id, @movie.id))
      end
    end
  end
end
