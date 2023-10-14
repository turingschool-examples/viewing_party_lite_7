require 'rails_helper'

RSpec.describe 'Movie Results' do
  before(:each) do
    load_test_data
  end
  describe 'happy path' do
    it 'Get top 20 rated movies' do
      visit "/users/#{@user1.id}/discover"
    
      expect(page).to have_button("Discover Top Rated Movies")
      expect(page).to have_button("Search by Movie Title")

      # json_response = File.read('spec/fixtures/top_twenty_movies.json')
      # stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=2c14ab06be3bfe4ca5fecd0f9b2c73fc").
      #    with(
      #      headers: {
      #     'Accept'=>'*/*',
      #     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #     'User-Agent'=>'Faraday v2.7.11'
      #      }).
      #      to_return(status: 200, body: json_response, headers: {})

      click_button "Discover Top Rated Movies"

      expect(page.status_code).to eq 200

      expect(page).to have_link("The Equalizer 3")
      expect(page).to have_content(7.3)

      # save_and_open_page
      
    end

    it 'Get searched movies' do
      visit "/users/#{@user1.id}/discover"
    
      expect(page).to have_button("Discover Top Rated Movies")
      expect(page).to have_button("Search by Movie Title")

      # json_response = File.read('spec/fixtures/batman_movies.json')
      # stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=2c14ab06be3bfe4ca5fecd0f9b2c73fc&query=Batman").
      #    with(
      #      headers: {
      #     'Accept'=>'*/*',
      #     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #     'User-Agent'=>'Faraday v2.7.11'
      #      }).
      #    to_return(status: 200, body: json_response, headers: {})

      fill_in 'Movie_Title', with: "Batman"
      click_button "Search by Movie Title"

      expect(page.status_code).to eq 200

      expect(page).to have_link("Batman Begins")
      expect(page).to have_content(7.2)

      # save_and_open_page
      
    end
  end
end