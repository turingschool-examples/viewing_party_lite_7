require 'rails_helper'

RSpec.describe 'Movies Results Page', type: :feature do
  before :each do
  @u1 = User.create!(name: 'Brian', email: 'brian@brian.com')
  @u2 = User.create!(name: 'Lorien', email: 'lorienlorienl.com')
  @u3 = User.create!(name: 'Rachel', email: 'rachel@rachel.com')
  @movie1 = Movie.new(title: 'Movie Title 1', vote_average: 9.5, runtime: 100, api_id: 1)
end

  it 'displays top rated movie results and a return button' do
  stub_request(:get, "https://api.themoviedb.org/3/search/movie.json?api_key").
        with(
          headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.11'
          }).
        to_return(status: 200, body: "", headers: {})
    visit user_discover_index_path(user_id: @u1.id)

    click_button 'Discover Top Rated Movies' 
    
    expect(page).to have_current_path(user_movies_path(@u1.id))

    within('#movie-results') do
      expect(page).to have_selector('tr', maximum: 20)
    end

    within('#movie-results') do
      expect(page).to have_link('Movie Title 1', href: movie_details_path(1)) 
      expect(page).to have_content('Vote Average: 9.5')
      expect(page).to have_link('Movie Title 2', href: movie_details_path(2))
    end

    expect(page).to have_link('Return to Discover Page', href: user_discover_index_path(user_id: @u1.id))
  end

  # do a test for the search button
end
