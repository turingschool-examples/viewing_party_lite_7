require 'rails_helper'

RSpec.describe "User's Discover Movies page" do
  before(:each) do
    @user1 = User.create!(name: 'John Smith', email: 'jsmith@aol.com')

    visit "/users/#{@user1.id}/discover"
  end

  it 'displays the users Discover Movies page' do
    expect(current_path).to eq("/users/#{@user1.id}/discover")
    expect(page).to have_content('Discover Movies')
  end

  # Button to Discover Top Rated Movies
  # A text field to enter keyword(s) to search by movie title
  # A Button to Search by Movie Title
  # Details When the user clicks on the Top Rated Movies OR the search button, they should be taken to the movies results page (more details of this on the Movies Results Page issue.

  # The movies will be retrieved by consuming The MovieDB API
  it 'displays a button to Discover Top Rated Movies' do
    within('#discover-top-movies') do
      expect(page).to have_button('Find Top Rated Movies')

      click_button('Find Top Rated Movies')
      expect(current_path).to eq(user_movies_path(@user1))
    end
  end

  xit 'displays a text field to enter keyword(s) to search by movie title' do
    within('#search-movies') do
      expect(page).to have_field('Search by Movie Title', type: 'text')
      expect(page).to have_button('Find Movies')
    end
  end

  xit 'has a button to Search by Movie Title' do
    within('#search-movies') do
      expect(page).to have_button('Find Movies')

      fill_in 'Search by Movie Title', with: 'The Matrix'
      click_button('Find Movies')
      expect(current_path).to eq(user_movies_path(@user1))
    end
  end
end

