require 'rails_helper'

RSpec.feature 'user movies index page', type: :feature do
  it 'displays 20 of the most populat movies', :vcr do
    weston = User.create(name: 'Weston', email: 'will@weston.com')
    
    visit discover_user_path(weston)

    click_button 'Discover Top Rated Movies'

    expect(current_path).to eq(user_movies_path(weston))
    expect(page).to have_content('The Godfather')
  end
  
  it 'displays 20 movies of the search query', :vcr do
    weston = User.create(name: 'Weston', email: 'will@weston.com')

    visit discover_user_path(weston)

    fill_in :query, with: 'The Matrix'

    click_button 'Search'

    expect(current_path).to eq(user_movies_path(weston))
    expect(page).to have_content('The Matrix')
  end
end