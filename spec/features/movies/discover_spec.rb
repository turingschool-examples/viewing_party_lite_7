require "rails_helper"

RSpec.describe "Discover Movies Page" do
  before do
    create_list(:user, 1)
    @user = User.first
    visit user_discover_path(@user)
  end

  it "has a button to discover top rated movies", :vcr do     
      expect(page).to have_button("Top Rated Movies")

      click_button("Top Rated Movies")
      expect(current_path).to eq(user_movies_path(@user))
  end

  it "has a form to search for movies by title", :vcr do
    expect(page).to have_field("search")
    expect(page).to have_button("Search")
    fill_in "Search", with: "Lord Of The"

    click_button("Search")
    expect(current_path).to eq(user_movies_path(@user))
  end
end