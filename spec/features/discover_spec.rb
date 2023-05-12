require 'rails_helper'

feature "Discover page" do
  let!(:user) { create(:user) }

  before(:each) { visit discover_user_path(user) }

  scenario "User sees the Discover Top Rated Movies button and the search field" do
    expect(page).to have_button("Discover Top Rated Movies")
    expect(page).to have_field("query")
    expect(page).to have_button("Search by Movie Title")
  end

  scenario "User clicks on Discover Top Rated Movies button", :vcr do
    click_button "Discover Top Rated Movies"
    expect(current_path).to eq(movies_path(user))
  end

  scenario "User enters keywords and clicks on Search by Movie Title button", :vcr do
    fill_in "query", with: "Star Wars"
    click_button "Search by Movie Title"
    expect(current_path).to eq(movies_path(user))
  end

  scenario "User clicks on a movie and goes to movie show page", :vcr do
    visit movies_path(user)
    click_link "The Godfather"
    expect(current_path).to eq(movie_path(user))
    expect(page).to have_button("Create a viewing party for The Godfather")
  end
end
