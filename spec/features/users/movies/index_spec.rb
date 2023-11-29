require 'rails_helper'

describe 'Dashboard: Discover Movies' do
  before :each do
    test_data
    visit user_path(@user1)
  end

  it "has the title as a link to movie details page" do
    click_button "Discover Movies"
    click_button "Discover Top Rated Movies"

    expect(page).to have_content("Title:")
    expect(page).to have_content("Vote Average:")
  end
end