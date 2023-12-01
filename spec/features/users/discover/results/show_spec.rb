require 'rails_helper'

RSpec.describe 'movies detail page', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
    json_response = File.read('spec/fixtures/user_discover_results_show.json')
    json_response1 = File.read('spec/fixtures/user_discover_results_show_credits.json')
    json_response2 = File.read('spec/fixtures/user_discover_results_show_reviews.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/238").
          with(
            headers: {
                  'Accept'=>'*/*',
                  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                  'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMWY5Y2FlYmQ2ZmNlYjUzMDAyNWQ0OGYyMzFmODUzYyIsInN1YiI6IjY1NjUyMjJlNWNlYTE4MDBjNTQ4N2MxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0RdSJKPQp2j6olRbyyMsEBtsH6iKAZKMcPWseHnO_nI',
                  'User-Agent'=>'Faraday v2.7.12'
            }).
          to_return(status: 200, body: json_response, headers: {})
          stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits").
          with(
            headers: {
           'Accept'=>'*/*',
           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
           'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMWY5Y2FlYmQ2ZmNlYjUzMDAyNWQ0OGYyMzFmODUzYyIsInN1YiI6IjY1NjUyMjJlNWNlYTE4MDBjNTQ4N2MxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0RdSJKPQp2j6olRbyyMsEBtsH6iKAZKMcPWseHnO_nI',
           'User-Agent'=>'Faraday v2.7.12'
            }).
          to_return(status: 200, body: json_response1, headers: {})
          stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews").
          with(
            headers: {
           'Accept'=>'*/*',
           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
           'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMWY5Y2FlYmQ2ZmNlYjUzMDAyNWQ0OGYyMzFmODUzYyIsInN1YiI6IjY1NjUyMjJlNWNlYTE4MDBjNTQ4N2MxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0RdSJKPQp2j6olRbyyMsEBtsH6iKAZKMcPWseHnO_nI',
           'User-Agent'=>'Faraday v2.7.12'
            }).
          to_return(status: 200, body: json_response2, headers: {})

  end

  it 'has a button to create a viewing party' do
    visit "/users/#{@user1.id}/movies/238"
    expect(page).to have_content("Create a Viewing Party")
    click_button "Create a Viewing Party"
    expect(current_path).to eq("/users/#{@user1.id}/movies/238/parties/new")
  end

  it 'has a button to return to the discover page' do 
    visit "/users/#{@user1.id}/movies/238"
    expect(page).to have_content("Back to Discover Page")
    click_button "Back to Discover Page"
    expect(current_path).to eq(user_discover_index_path(@user1))
  end

  it 'has movie attributes such as title, vote average, 
    runtime, genre, summary, cast members(first 10), total reviews
    and each reviews author and information' do
    visit "/users/#{@user1.id}/movies/238"
    expect(page).to have_content("Movie Title: The Godfather")
    expect(page).to have_content("Vote Average: ") # change testing because numbers will change
    expect(page).to have_content("Runtime: 2h 55min")
    expect(page).to have_content("Genre: [\"Drama\", \"Crime\"]")
    expect(page).to have_content("Summary: Spanning the years")
    expect(page).to have_content("Cast Members")
    expect(page).to have_content("Marlon Brando") # still need to test for 10 cast members
    expect(page).to have_content("Reviews")
    expect(page).to have_content("Review Count: 5")
    expect(page).to have_content("Author: futuretv")
    expect(page).to have_content("Review Details: The Godfather Review")
  end
end
