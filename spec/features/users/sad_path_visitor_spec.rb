require "rails_helper"

RSpec.describe "Sad Path Visitor", :vcr do
  describe "as a visitor" do
    it "Errors if trying to visit dashboard while not logged in" do
      visit root_path

      expect(current_path).to eq(root_path)

      visit dashboard_path

      expect(current_path).to eq(root_path)
      expect(page).to have_content("You must be logged in to visit that page.")
    end

    it "can't create a viewing party when not logged in" do
      movie = MovieFacade.new(255).movie_id

      visit movie_path(movie)

      click_button "Create Viewing Party"

      expect(current_path).to eq(movie_path(movie))
      expect(page).to have_content("You must be logged in to create a viewing party.")
    end
  end
end