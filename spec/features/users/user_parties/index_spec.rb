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
    oppenheimer_test_data

    visit user_discover_index_path(@user1)
  end

  it "when visiting the discover path, user can see a button to 'Discover Top Rated Movies'" do
    expect(page).to have_button("Discover Top Rated Movies")
  end

  it "user can see the form to search by title and a 'Search by Movie Title' button" do
    expect(page).to have_field(:query)
    expect(page).to have_button("Search by Movie Title")
  end

  it "when the user clicks the 'Top Rated Movies' button it takes the user to the movies results page" do
    click_button "Top Rated Movies"
    expect(current_path).to eq(user_results_path(@user1))
  end

  it "when the user clicks the 'Search by Movie Title' button it takes the user to the movies results page" do
    fill_in :query, with: "Trolls"
    click_button "Search by Movie Title"
    expect(current_path).to eq(user_results_path(@user1))
  end

  describe "sad path testing" do
    it "stays on current page and gives error if no search terms are present" do
      click_button "Search by Movie Title"
      expect(current_path).to eq(user_discover_index_path(@user1))
      expect(page).to have_content("No Search Terms Provided.")
    end
  end
end