require 'rails_helper'

RSpec.describe 'User Discover Movies Page', :vcr do
  before do
    @ally = User.create!(name: 'Ally Jean', email: 'allyjean@example.com')
  end

  it 'links from the user dashboard' do
    visit user_path(@ally)

    click_button('Discover Movies')
    expect(current_path).to eq(user_discover_path(@ally))

    expect(page).to have_content('Discover Movies')
  end

  # As an user,
  # When I visit the '/users/:id/discover' path, where :id, is the id of a valid user,
  # I should see

  #  Button to Discover Top Rated Movies
  #  A text field to enter keyword(s) to search by movie title
  #  A Button to Search by Movie Title
  # Details When the user clicks on the Top Rated Movies OR the search button, they should be taken to the movies results page (more details of this on the Movies Results Page issue.

  # The movies will be retrieved by consuming The MovieDB API

  it 'can link to the find top rated movies page' do
    visit user_discover_path(@ally)
    expect(page).to have_button('Find Top Rated Movies')
    click_button('Find Top Rated Movies')
    expect(current_path).to eq(user_movies_path(@ally))
  end

  it 'can link to the find movies by keyword page' do
    visit user_discover_path(@ally)
    expect(page).to have_field('Find Movies')
    expect(page).to have_button('Search')
    fill_in 'Find Movies', with: 'Inception'
    click_button('Search')
    expect(current_path).to eq(user_movies_path(@ally))
  end
end
