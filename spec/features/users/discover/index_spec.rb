require 'rails_helper'

RSpec.describe 'user discover page', type: :feature do
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
         json_response1 = File.read('spec/fixtures/discover_index_query.json')
         stub_request(:get, "https://api.themoviedb.org/3/search/movie?query=Nightmare%20Before%20Christmas").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMWY5Y2FlYmQ2ZmNlYjUzMDAyNWQ0OGYyMzFmODUzYyIsInN1YiI6IjY1NjUyMjJlNWNlYTE4MDBjNTQ4N2MxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0RdSJKPQp2j6olRbyyMsEBtsH6iKAZKMcPWseHnO_nI',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response1, headers: {})
  end

  it 'has a button to discover top rated movies' do
    visit user_discover_index_path(@user1)
    expect(page).to have_button('Discover Top Rated Movies')
  end

  context 'discover top rated movies button is clicked' do
    it 'redirects to movie results page, listing top rated movies' do
      visit user_discover_index_path(@user1)
      click_button('Discover Top Rated Movies')
      expect(current_path).to eq(user_movies_path(@user1))
      expect(page).to have_content('The Godfather')
    end
  end

  it 'has a form to search by movie title' do
    visit user_discover_index_path(@user1)
    within('#search') do
      expect(page).to have_field(:title)
      expect(page).to have_button('Search by Movie Title')
    end
  end

  context 'search by title form is filled out and submitted' do
    it 'redirects to movie results page with relevant movies' do
      visit user_discover_index_path(@user1)
      fill_in :title, with: 'Nightmare Before Christmas'
      click_button('Search by Movie Title')
      expect(current_path).to eq(user_movies_path(@user1))
      expect(page).to have_content('Nightmare Before Christmas')
    end
  end
end
