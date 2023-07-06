require "rails_helper"

RSpec.describe "/users/:id/movies", type: :feature do
  let!(:user) { create(:user) }

  describe "when a user visits the discovery page" do
    describe "and they click on Find Top Rated Movies" do
      it "routes to a movie index page where the top movies are rendered" do
        visit user_discover_index_path(user)

        click_button("Find Top Rated Movies")

        expect(current_path).to eq(user_movies_path(user))

        expect(page).to have_css(".movie", maximum: 20)

        within(first(".movie")) do
          expect(page).to have_css(".title")
          expect(page).to have_css(".vote_avg")
        end
      end
    end

    describe "they search for a movie in the search bar" do
      xit "routes to the movie index page where search results are rendered" do
        visit user_discover_index_path(user)

        within ".search-movies" do
          fill_in "Search:", with: "Princess"
          click_button "Find Movies"
        end

        expect(current_path).to eq(user_movies_path(user))
        expect(page).to have_css(".movie", maximum: 20)

        within(first(".movie")) do
          expect(page).to have_css(".title")
          expect(page).to have_css(".vote_avg")
        end
      end
    end
  end

  describe "as a user on the movie index page" do
    it "displays a button to return back to the discover page" do
      visit user_movies_path(user)

      click_button "Discover Page"

      expect(current_path).to eq(user_discover_index_path(user))
    end
  end
end