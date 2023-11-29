require 'rails_helper'

describe 'Dashboard: Discover Movies' do
  before :each do
    test_data
  end

  it "has the title as a link to movie details page" do
   popular_movies_fixture = File.read("spec/fixtures/popular_movies.json")
    stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=67af88004fc9a5fe47497bb47e0dc073").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: popular_movies_fixture, headers: {})

    visit user_path(@user1)
    click_button "Discover Movies"
    click_button "Discover Top Rated Movies"

    expect(page).to have_content("Title:")
    expect(page).to have_content("Vote Average:")
  end
end