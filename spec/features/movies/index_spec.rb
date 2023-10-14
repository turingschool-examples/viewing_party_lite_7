require 'rails_helper'

RSpec.feature 'user movies index page', type: :feature do
  it 'displays 20 of the most populat movies', :vcr do
    weston = User.create(name: 'Weston', email: 'will@weston.com')
    
    visit discover_user_path(weston)

    click_button 'Discover Top Rated Movies'

    expect(current_path).to eq(user_movies_path(weston))
    expect(page).to have_content('The Godfather')
    expect(page).to have_content(8.7)
    expect(page).to have_selector('table tbody tr', count: 20)
  end
  
  it 'displays 20 movies of the search query', :vcr do
    weston = User.create(name: 'Weston', email: 'will@weston.com')

    visit discover_user_path(weston)

    fill_in :query, with: 'The Matrix'

    click_button 'Search'

    expect(current_path).to eq(user_movies_path(weston))
    expect(page).to have_content('The Matrix')
    expect(page).to have_selector('table tbody tr', count: 20)
  end
end