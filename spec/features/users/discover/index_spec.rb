require 'rails_helper'

RSpec.describe 'Discover Movies Page' do
  before(:each) do
    load_test_data
  end

  it 'When a user can get to movie results through movie title search' do
    visit "/users/#{@user1.id}/discover"

    expect(page).to have_button('Discover Top Rated Movies')
    expect(page).to have_button('Search by Movie Title')

    fill_in 'Movie_Title', with: 'Batman'
    # click_button "Search by Movie Title"

    # expect(current_path).to eq("/users/#{@user1.id}/movies")
  end

  it 'When a user can get to movie results through top rated movies button' do
    visit "/users/#{@user1.id}/discover"

    expect(page).to have_button('Discover Top Rated Movies')
    expect(page).to have_button('Search by Movie Title')

    # click_button "Discover Top Rated Movies"

    # expect(current_path).to eq("/users/#{@user1.id}/movies")
  end
end
