require "rails_helper"

describe "When I visit the '/users/:id/discover' path, where :id, is the id of a valid user" do
  before :each do
    @user = create(:user)

    visit user_movies_discover_path(@user)
  end

  describe "i should see" do
    it "a button to discover top rated movies" do
      expect(page).to have_button("Discover Top Rated Movies")
    end

    it "a text field to enter keywords to search by movie title" do
      within "#search" do
        expect(page).to have_field("movie_title")
      end
    end

    it "a button to search by movie title" do
      within "#search" do
        expect(page).to have_button("Search by Movie Title")
      end
    end
  end

  describe "details" do
    it "When the user clicks on the Top Rated Movies, they should be taken to the movies results page" do
      click_button "Discover Top Rated Movies"

      expect(page).to have_current_path("/users/#{@user.id}/movies")
    end

    it "When the user clicks on the search button, they should be taken to the movies results page" do
      within "#search" do
        fill_in "movie_title", with: "Dispicable Me"
        click_button "Search by Movie Title"

        expect(page.current_path).to include("/users/#{@user.id}/movies")
      end
    end
  end
end