require 'rails_helper'

RSpec.describe 'Movie Results', :vcr do
  before :each do
    @user = create(:user)
  end

  describe "user can click on Top Rated or Search and be taken to movie results page" do
    scenario "click on Top Rated Movies" do
      visit movie_index_path(@user)
      click_on "Find Top Rated Movies"
      
      expect(current_path).to eq(movie_results_path(@user))
      expect(page).to have_css(".movie", count: 20)
      within(first(".movie")) do
        expect(page).to have_css(".title")
        expect(page).to have_css(".vote_average")
      end
    end

    describe "click on the Search button" do
      scenario "user doesn't enter a keyword into the text field" do
        click_on "Find Movies"

        expect(current_path).to eq(movie_results_path(@user))
        expect(page).to have_css(".movie", count: 0)
      end

      scenario "user enters a keyword into the text field" do
        fill_in :keywords, with: "ocean"
        click_on "Find Movies"

        expect(current_path).to eq(movie_results_path(@user))
        expect(page).to have_css(".movie", count: 20)
        within(first(".movie")) do
          expect(page).to have_css(".title")
          expect(page).to have_css(".vote_average")
        end
      end
    end
  end
end