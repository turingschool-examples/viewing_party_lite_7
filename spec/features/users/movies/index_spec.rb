require 'rails_helper'

RSpec.describe 'Movie Results' do
  before(:each) do
    load_test_data
  end
  describe 'happy path' do
    it 'Get top 20 rated movies' do
      json_response = File.read('spec/fixtures/top_twenty_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=#{Rails.application.credentials.tmdb[:key]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response, headers: {})

      visit "/users/#{@user1.id}/discover"
    
      expect(page).to have_button("Discover Top Rated Movies")
      expect(page).to have_button("Search by Movie Title")

      click_button "Discover Top Rated Movies"

      expect(page.status_code).to eq 200

      expect(page).to have_link("Trolls Band Together")
      expect(page).to have_content(7.215)
    end

    it 'Get searched movies' do
      visit "/users/#{@user1.id}/discover"
    
      expect(page).to have_button("Discover Top Rated Movies")
      expect(page).to have_button("Search by Movie Title")

      json_response = File.read('spec/fixtures/batman_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{Rails.application.credentials.tmdb[:key]}&query=Batman").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response, headers: {})

      fill_in 'Movie_Title', with: "Batman"
      click_button "Search by Movie Title"

      expect(page.status_code).to eq 200

      expect(page).to have_link("Batman Begins")
      expect(page).to have_content(7.2)
    end
  end
end