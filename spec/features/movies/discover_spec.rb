require 'rails_helper'

RSpec.describe "Movies Discover page" do
  before(:each) do
    test_data
  end
  describe "As a user, when I visit the '/users/:id/discover' path"
  it "has a button to discover top rated movies" do
    visit "/users/#{@user_1.id}/discover"

    within("#top-movies") do
      expect(page).to have_button("Find Top Rated Movies")
      click_button "Find Top Rated Movies"
    end

    expect(current_path).to eq("/users/#{@user_1.id}/movies")
  end

  it "can search by movie title" do
    visit "/users/#{@user_1.id}/discover"

    within("#search-movies") do
      fill_in(:search, with: "Fight Club")
      click_button "Find Movies"
    end

    expect(current_path).to eq("/users/#{@user_1.id}/movies")
    # expect(page).to have_content("Fight Club")
  end
end
