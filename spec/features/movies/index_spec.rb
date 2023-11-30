require "rails_helper"

RSpec.describe "Movies Index Page" do
  before(:each) do
    load_test_data
  end

  it "Top Rated Movies button", :vcr do
    visit "/users/#{@user2.id}/discover"

    expect(page).to have_link("Home")

    expect(page).to have_button("Find Movies")
    expect(page).to have_button("Top Rated Movies")

    click_button("Top Rated Movies")
    expect(current_path).to eq("/users/#{@user2.id}/movies")

    expect(page).to have_content("Results")
    expect(page).to have_link("Return to Discover Page")
    expect(page).to have_link("Home")

    click_link("Return to Discover Page")
    expect(current_path).to eq("/users/#{@user2.id}/discover")
  end

  it "Search movies by title", :vcr do
    visit "/users/#{@user2.id}/discover"

    expect(page).to have_link("Home")

    expect(page).to have_button("Find Movies")
    expect(page).to have_button("Top Rated Movies")

    fill_in :q, with: "Django"

    click_button("Find Movies")

    expect(current_path).to eq("/users/#{@user2.id}/movies")


    # SAD PATH NEEDED #  What if you click 'Find Movies' without entering search params??    
  

  end

  describe '#Sad Path' do
    it 'empty search params when searching for a movie' do
      visit "/users/#{@user2.id}/discover"

      expect(page).to have_button("Find Movies")

      fill_in :q, with: ""
      click_button("Find Movies")

      expect(page).to have_content("Please enter a Movie title")

      expect(current_path).to_not eq("/users/#{@user2.id}/movies")
      expect(current_path).to eq("/users/#{@user2.id}/discover")
    end
  end
end