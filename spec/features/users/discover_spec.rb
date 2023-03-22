require 'rails_helper'

RSpec.describe "/users/:id/discover", type: :feature do
  describe "as a user, when I visit the movie dashboard page" do 
    before :each do
      @picard = User.create!(name: "Jean-Luc Picard", email: "captain@uss-enterprise.com")
      
      visit "/users/#{@picard.id}/discover"
    end

    # User Story 5
    it "exists and should display page details" do
      expect(page).to have_content("Discover Movies")
      expect(page).to have_button("Find Top Rated Movies")
      expect(page).to have_field("Movie Title", :with => "search")
      expect(page).to have_button("Search by Movie Title")
    end
    
    # User Story 5
    it "can accept movie names & redirect to result page" do
      fill_in(:search, with: "2001: A Space Odyssey")
      click_button("Search by Movie Title")

      expect(current_path).to eq("/users/#{@picard.id}/movies")
    end

    # User Story 5
    it "can accept partial keywords & redirect to result page" do
      fill_in(:search, with: "space")
      click_button("Search by Movie Title")

      expect(current_path).to eq("/users/#{@picard.id}/movies")
    end

    # User Story 5
    it "click Top Rated Movies button, redirected to '/users/:id/movies' (movies result page) " do
      click_button("Find Top Rated Movies")
      expect(current_path).to eq("/users/#{@picard.id}/movies")
    end

    # User Story 5
    it "click Search Movie Title button, redirected to '/users/:id/movies' (movies result page)" do
      click_button("Search by Movie Title")
      expect(current_path).to eq("/users/#{@picard.id}/movies")
    end
  end
end