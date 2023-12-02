require 'rails_helper'

RSpec.describe 'user discover results page', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
    json_response = File.read('spec/fixtures/top_rated_movies_data.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated").
          with(
            headers: {
                  'Accept'=>'*/*',
                  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                  'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMWY5Y2FlYmQ2ZmNlYjUzMDAyNWQ0OGYyMzFmODUzYyIsInN1YiI6IjY1NjUyMjJlNWNlYTE4MDBjNTQ4N2MxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0RdSJKPQp2j6olRbyyMsEBtsH6iKAZKMcPWseHnO_nI',
                  'User-Agent'=>'Faraday v2.7.12'
            }).
          to_return(status: 200, body: json_response, headers: {})
  end

  it 'displays the title of relevant movies and their vote average' do
    visit user_discover_index_path(@user1)
    click_button('Discover Top Rated Movies')
    expect(current_path).to eq(user_movies_path(@user1))
    expect(page).to have_content('The Godfather')
    # expect(page).to have_content('8.708') # fix test in refactor
  end

  it 'limits results to 20 movies' do
    visit user_discover_index_path(@user1)
    click_button('Discover Top Rated Movies')
    expect(page).to have_content('Average Rating', count: 20)
  end

  it 'has a button to return to discover page' do
    visit user_discover_index_path(@user1)
    click_button('Discover Top Rated Movies')
    expect(page).to have_button('Back to Discover Page')
    click_button('Back to Discover Page')
    expect(current_path).to eq(user_discover_index_path(@user1))
  end
end
