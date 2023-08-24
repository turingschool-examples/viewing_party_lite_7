require 'rails_helper'

describe "Discover Movies Page" do
  before do
    @user = create(:user)
    visit user_discover_path(@user)
  end

  it "has a button to discover top rated movies" do
    VCR.use_cassette("top_20_rated_movies") do
      expect(page).to have_button("Find Top Rated Movies")
      click_button("Find Top Rated Movies")

      expect(current_path).to eq(user_movies_path(@user))
    end
  end

  xit "has a text field to enter keyword(s) to search by movie title" do
    expect(page).to have_field("Keywords")
    expect(page).to have_button("Find Movies")
  end

  it "has a link to the root page" do
    expect(page).to have_link('Home', href: root_path)
  end
end



# I should see
# Button to Discover Top Rated Movies
# A text field to enter keyword(s) to search by movie title
# A Button to Search by Movie Title