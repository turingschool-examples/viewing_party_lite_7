require "rails_helper"

RSpec.describe "Movie Details Page", type: :feature do
  before(:each) do
    @user = User.create!(name: "John", email: "john@example.com")

    stub_request(:get, "https://api.themoviedb.org/3/movie/120?api_key=#{ENV['MOVIE_API_KEY']}")
    .to_return(status: 200, body: File.read("./spec/fixtures/lord_of_the_rings_collection.json"))
  end
  describe "when I visit the movie details page" do
    context "Happy Path" do
      it "I see a button to go back to the discover page and to create a viewing party" do
        visit user_movie_path(@user, 120)
        expect(page).to have_button("Discover Page")
        click_button("Discover Page")
        expect(current_path).to eq(user_discover_index_path(@user))
      end

      it "I see a button to create a viewing party" do
        visit user_movie_path(@user, 120)
        expect(page).to have_button("Make a Viewing Party")
        click_button("Make a Viewing Party")
      end
    end
  end
end
