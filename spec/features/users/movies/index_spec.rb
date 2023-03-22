require 'rails_helper'

RSpec.describe "/users/:id/movies", type: :feature do
  describe "as a user, when I visit the movie index page" do 
    before :each do
      @picard = User.create!(name: "Jean-Luc Picard", email: "captain@uss-enterprise.com")
    end

    # User Story 5
    it "can search for movie name, redirect here, & display the first 20 top movies" do
      visit "/users/#{@picard.id}/discover"
      click_button("Find Top Rated Movies")
      expect(current_path).to eq("/users/#{@picard.id}/movies")

      expect(page).to have_content()
    end

    # User Story 5
    xit "can search for movie name, redirect here, & display display max 20 movies with those keywords" do
      visit "/users/#{@picard.id}/discover"
      fill_in(:search, with: "2001: A Space Odyssey")
      click_button("Search by Movie Title")
      expect(current_path).to eq("/users/#{@picard.id}/movies")

      expect(page).to have_content()
    end

    # User Story 5
    xit "can search for partial keywords, redirect here, & display max 20 movies with those keywords" do
      visit "/users/#{@picard.id}/discover"
      fill_in(:search, with: "2001: A Space Odyssey")
      click_button("Search by Movie Title")
      expect(current_path).to eq("/users/#{@picard.id}/movies")

      expect(page).to have_content()
    end    
  end
end

