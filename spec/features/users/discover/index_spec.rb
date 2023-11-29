require 'rails_helper'

RSpec.describe 'Discover Movies Page' do
  before(:each) do
    load_test_data
  end

  it 'redirects to discover page when "Discover Movies" button is clicked' do
    visit user_path(@user1)
    click_button 'Discover Movies'

    expect(current_path).to eq(user_discover_path(@user1))
  end

  it 'displays "Discover Top Rated Movies" and "Search by Movie Title" buttons on discover page' do
    visit user_discover_index_path(@user1)
    expect(page).to have_button('Discover Top Rated Movies')
    expect(page).to have_button('Search by Movie Title')
  end

  it 'redirects to movie results page when "Search by Movie Title" button is clicked' do
    visit user_discover_index_path(@user1)

    fill_in 'Movie_Title', with: 'Batman'
    click_button 'Search by Movie Title'

    expect(current_path).to eq(user_movies_path(@user1))
  end

  it 'redirects to movie results page when "Discover Top Rated Movies" button is clicked' do
    visit user_discover_index_path(@user1)

    click_button 'Discover Top Rated Movies'

    expect(current_path).to eq(user_movies_path(@user1))
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
