require "rails_helper"

RSpec.describe "Movies Index Page" do
  before(:each) do
    load_test_data
  end

  it 'Links, button, and search' do
    visit "/users/#{@user2.id}/discover"

    expect(page).to have_link("Home")

    expect(page).to have_button("Top Rated Movies")
    expect(page).to have_button("Find Movies")


    # click_button("Top Rated Movies")
    # expect(current_path).to eq("/users/#{@user2.id}/movies")
  end
end