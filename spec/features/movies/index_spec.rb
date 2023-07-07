require "rails_helper"

RSpec.describe "Movie Results page", type: :feature do
  context "when I press the button to discover top movies" do
    before(:each) do
      @user1 = User.create!(name: "Myles", email: "myles@example.com")
      @user2 = User.create!(name: "Boston", email: "boston@example.com")
      visit user_discover_index_path(@user1.id)
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}")
        .to_return(status: 200, body: File.read("./spec/fixtures/top_rated_movies.json"))
      stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&query=The%20fellowship%20of%20the%20ring")
        .to_return(status: 200, body: File.read("./spec/fixtures/search_movie.json"))
    end
    context "Happy Path" do
      it "I am taken to the results page and see the top rated movies" do
        click_button("Discover Top Rated Movies")
        expect(current_path).to eq(user_movies_path(@user1.id))

        expect(page).to have_link("The Godfather")
        expect(page).to have_content("Rating: 8.7")

        expect(page).to have_link("Back")
        click_link("Back")
        expect(current_path).to eq(user_discover_index_path(@user1))
      end

      it "I am taken to the results page and see the movie I searched for" do
        fill_in "Movie Title", with: "The fellowship of the ring"
        click_button("Find Movies")
        expect(current_path).to eq(user_movies_path(@user1.id))

        expect(page).to have_link("The Lord of the Rings: The Fellowship of the Ring")
        expect(page).to have_content("Rating: 8.399")
      end
    end
  end
end
