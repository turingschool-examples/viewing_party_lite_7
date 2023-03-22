require 'rails_helper'

RSpec.describe "party new page", type: :feature do
  before :each do 
    @andra = User.create!(name: "Andra", email: "andra@turing.edu")
    @hady = User.create!(name: "Hady", email: "hady@turing.edu")
    VCR.use_cassette("top_rated_movies") do
      @results = MoviesFacade.top_rated_movies
    end
  end 
  describe "when visit the viewing party page" do 

    it "when navigate to the viewing party new page" do
      VCR.use_cassette("movie_id_238", :allow_playback_repeats => true) do
        visit "/users/#{@hady.id}/movies/#{@results[0].movie_id}"

        click_link("Create Viewing Party")
        expect(page).to have_content("Movie Title: ")
        expect(page).to have_content("Vote Average: ")
        expect(page).to have_content("Movie Title: ")
        

      end 
    end 
  end 
end 
