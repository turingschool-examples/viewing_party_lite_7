require "rails_helper"

describe "Discover Index Page", :vcr do
  before(:each) do
    @user_1 = User.create(name: "Bob", email: "bob@myemail.com")
		@party = @user_1.parties.create!(duration: 120, time: "12:00:00", date: "2021-08-01")
  end

  it "has a button to discover movies" do
    visit user_discover_index_path(@user_1)

    expect(page).to have_button("Discover Top Rated Movies")
  end

  it "has a search field for movies" do
    visit user_discover_index_path(@user_1)

    expect(page).to have_field(:movie_title)
    expect(page).to have_button("Search")
  end
end

