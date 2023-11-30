require 'rails_helper'

RSpec.describe 'Movie Details Page', type: :feature do
  describe 'when a user visits a movies details page' do
    before(:each) do
      @user = create(:user)

      visit "users/#{@user.id}/movies/238"
    end

    it "displays a button to create a button to create a viewing party" do
      expect(page).to have_button("Create A Party")
    end

    it "displays a button to return to the discover page" do
      expect(page).to have_button("Discover Page")
    end

    it "displays details about the movie" do
      expect(page).to have_content("The Godfather")
      expect(page).to have_content("Average Rating: 8.7")
      expect(page).to have_content("Runtime: 175 min")
      expect(page).to have_content("Genre(s): Drama, Crime")
      expect(page).to have_content("Summary: Spanning the years 1945 to 1955")
      # expect(page).to have_content("Cast Members: ")
      # expect(page).to have_content("Total Reviews: ")
      # expect(page).to have_content("Review Author: ")
      # expect(page).to have_content("Review Details: ")
    end
  end
end