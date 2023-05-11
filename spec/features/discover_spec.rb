require 'rails_helper'

RSpec.feature "Discover page" do
  let!(:user) { create(:user) }

  before(:each) do
    visit discover_user_path(user)
  end

  scenario "User sees the Discover Top Rated Movies button and the search field" do
    expect(page).to have_button("Discover Top Rated Movies")

    expect(page).to have_field("query")
    expect(page).to have_button("Search by Movie Title")
  end

  scenario "User clicks on Discover Top Rated Movies button" do
    VCR.use_cassette('discover_top_movies') do
      click_button "Discover Top Rated Movies"
    end
    expect(current_path).to eq(movies_path(user))
  end

  scenario "User enters keywords and clicks on Search by Movie Title button" do
    VCR.use_cassette('movie_search') do
      fill_in "query", with: "Star Wars"
      click_button "Search by Movie Title"
    end
  
    expect(current_path).to eq(movies_path(user))
  end
end
