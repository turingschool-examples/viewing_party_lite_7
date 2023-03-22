# As an user,
# When I visit the '/users/:id/discover' path, where :id, is the id of a valid user,
# I should see

#  Button to Discover Top Rated Movies
#  A text field to enter keyword(s) to search by movie title
#  A Button to Search by Movie Title
# Details When the user clicks on the Top Rated Movies OR the search button,
# they should be taken to the movies results page (more details of this on the Movies Results Page issue.

require 'rails_helper'

RSpec.describe 'user discover page' do
  before(:each) do
    @user_1 = create(:user)
    @party1 = create(:viewing_party)
    @party2 = create(:viewing_party)
    create(:user_party, user: @user_1, viewing_party: @party1, host: false)
    create(:user_party, user: @user_1, viewing_party: @party2, host: true)

    top_20_response = File.read('spec/fixtures/top_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: top_20_response)

    visit "/users/#{@user_1.id}/discover"
  end

  it 'displays the page title' do
    expect(page).to have_content('Discover Movies')
  end

  it 'it has a button to discover top rated movies' do
    expect(page).to have_button('Discover Top Rated Movies')

    click_button 'Discover Top Rated Movies'

    expect(current_path).to eq("/users/#{@user_1.id}/movies")
  end
end