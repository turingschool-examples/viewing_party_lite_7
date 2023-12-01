require 'rails_helper'

RSpec.describe 'Movie Details Page', type: :feature do
  describe 'when a user visits a movies details page' do
    before(:each) do
      @user = create(:user)

      visit "users/#{@user.id}/movies/238"
    end

    it "displays a button to create a button to create a viewing party", :vcr do
      expect(page).to have_button("Create A Party")
    end

    it "displays a button to return to the discover page", :vcr do
      expect(page).to have_button("Discover Page")
    end

    it "displays details about the movie", :vcr do
      expect(page).to have_content("The Godfather")
      expect(page).to have_content("Average Rating: 8.7")
      expect(page).to have_content("Runtime: 2:55")
      expect(page).to have_content("Genre(s): Drama, Crime")
      expect(page).to have_content("Summary: Spanning the years 1945 to 1955")
      expect(page).to have_content("Don Vito Corleone Played by: Marlon Brando")
      expect(page).to have_content("Total Reviews: 5")
      expect(page).to have_content("Author: futuretv")
      expect(page).to have_content("Content: Great Movie **Ever**")
    end
  end
end