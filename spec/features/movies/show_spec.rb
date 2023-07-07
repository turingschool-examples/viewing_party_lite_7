require "rails_helper"

RSpec.describe "/users/:user_id/movies/:movie_id", type: :feature do
  let!(:user) { create(:user) }

  before(:each) do
    visit user_movie_path(user, 238)
  end

  describe "as a user on a movie's show page" do
    it "the page displays info about the movie", :vcr do
      expect(page).to have_css(".title")
      expect(page).to have_css(".vote_avg")
      expect(page).to have_css(".runtime")
      expect(page).to have_css(".genre")
      expect(page).to have_css(".summary")
      expect(page).to have_css(".cast")
      expect(page).to have_css(".reviews")
    end

    xit "shows the first 10 cast members", :vcr do
      within(".cast") do

      end
    end

    xit "total count of reviews", :vcr do

    end

    xit "displays each review with author and comments", :vcr do

    end

    xit "has a button to create a viewing party for this movie", :vcr do

    end

    xit "has a button to route back to the discover page", :vcr do

    end
  end
end