require 'rails_helper'

describe 'Dashboard: Discover Movies' do
  before :each do
    test_data
    visit user_path(@user1)
  end

  it "when visiting a user dashboard and clicking the Discover Movies Button, it redirects to the specific user's discover page" do
    click_button "Discover Movies"
    expect(current_path).to eq(user_discover_index_path(@user1))
  end
end

describe 'Discover Movies Page' do
  before :each do
    test_data
    visit user_path(@user1)
  end

  it "when visiting the discover path, user can see a button to 'Discover Top Rated Movies'" do
    expect(page).to have_button("Discover Top Rated Movies")
  end

  it "user can see the form to search by title and a 'Search by Movie Title' button" do
    expect(page).to have_field(:search_by_title)
    expect(page).to have_button("Search by Movie Title")
  end

  it "when the user clicks the 'Top Rated Movies' button it takes the user to the movies results page" do
    expect(current_path).to eq(user_results_path(@user1))
  end

  it "when the user clicks the 'Search by Movie Title' button it takes the user to the movies results page" do
    expect(current_path).to eq(user_results_path(@user1))
  end
end