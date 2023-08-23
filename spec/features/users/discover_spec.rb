require 'rails_helper'

RSpec.describe "User's Discover Page" do
  it "has a button to discover top rated movies", :vcr do
    aquaria = User.create!(name: "Aquaria", email: "Aquariahoe@hotmess.com")

    visit user_discover_path(aquaria)

    expect(page).to have_button("Top Rated Movies")
  end
  
  it "has a text field to enter keywords to search by movie title", :vcr do
    aquaria = User.create!(name: "Aquaria", email: "Aquariahoe@hotmess.com")

    visit user_discover_path(aquaria)

    expect(page).to have_field(:search)
    click_on("Search By Movie Title")
    expect(current_path).to eq(user_movies_path(aquaria))
  end


end