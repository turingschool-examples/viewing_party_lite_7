require 'rails_helper' 

describe 'Dashboard: Discover Movies' do
  before :each do
    test_data
    oppenheimer_test_data
  end

  describe 'Top-Rated Movies' do
    it 'has the title as a link to movie details page' do

      visit user_path(@user1)
      click_button "Discover Movies"
      click_button "Discover Top Rated Movies"
      expect(page).to have_content("Vote Average:")
      expect(page).to have_link("The Super Mario Bros. Movie")
    end

    it "has the vote average of the movie" do

      visit user_path(@user1)
      click_button "Discover Movies"
      click_button "Discover Top Rated Movies"

      expect(page).to have_content("Vote Average: 7.747")
    end

    it "has 20 results" do

      visit user_path(@user1)
      click_button "Discover Movies"
      click_button "Discover Top Rated Movies"
      expect(current_path).to eq(user_results_path(@user1))

      expect(page).to have_content("20 Results")

    end

    it "has a button to return to the discover page" do

      visit user_path(@user1)
      click_button "Discover Movies"
      click_button "Discover Top Rated Movies"
      expect(page).to have_button("Return to Discover Page")

      click_button("Return to Discover Page")

      expect(current_path).to eq(user_discover_index_path(@user1))
    end
  end

  describe 'Going to the Movie Show Page' do
    it "has a link that will go to the movie show page" do
      visit user_discover_index_path(@user1)
      click_button "Search by Movie Title"
      click_link "Oppenheimer"

      expect(current_path).to eq(user_movie_path(@user1, 872585))
    end
  end
end
