require 'rails_helper'

RSpec.describe 'Movie Results' do
  before(:each) do
    load_test_data
  end
  it 'When I go to a user dashbaord, and click "Discover Movies" button, I am redirected to a discover page /users/:id/discover' do
    specific_movie_response = File.read('spec/fixtures/specific_movie.json')
    credits_response = File.read('spec/fixtures/specific_movie_credits.json')
    reviews_response = File.read('spec/fixtures/specific_movie_reviews.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/268?api_key=#{Rails.application.credentials.tmdb[:key]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: specific_movie_response, headers: {})

         stub_request(:get, "https://api.themoviedb.org/3/movie/268/credits?api_key=#{Rails.application.credentials.tmdb[:key]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: credits_response, headers: {})

         stub_request(:get, "https://api.themoviedb.org/3/movie/268/reviews?api_key=#{Rails.application.credentials.tmdb[:key]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: reviews_response, headers: {})

    visit "/users/#{@user1.id}/movies/268"
    click_link "Go back to Landing Page"
    expect(current_path).to eq("/")

    visit "/users/#{@user1.id}/movies/268"
    click_button "Create a Viewing Party"
    expect(current_path).to eq("/users/#{@user1.id}/movies/268/viewing-party/new")

    visit "/users/#{@user1.id}/movies/268"
    click_button "Discover Movies"
    expect(current_path).to eq(user_discover_index_path(user_id: @user1.id))
        
    visit "/users/#{@user1.id}/movies/268"

    expect(page).to have_content("Movie Id: 268")
    expect(page).to have_content("Vote Average: 7.2")
    expect(page).to have_content("Runtime: 2 hours 6 minutes") 
    expect(page).to have_content("Fantasy")
    expect(page).to have_content("Action")
    expect(page).to have_content("Crime")

    expect(page).to have_content("Batman must face his most ruthless nemesis when a deformed madman calling himself")

    expect(page).to have_content("Michael Keaton")
    expect(page).to have_content("Jack Nicholson")
    expect(page).to have_content("Kim Basinger")
    expect(page).to have_content("Michael Gough")
    expect(page).to have_content("Jerry Hall")
    expect(page).to have_content("Robert Wuhl")
    expect(page).to have_content("Pat Hingle")
    expect(page).to have_content("Billy Dee Williams")
    expect(page).to have_content("Jack Palance")
    expect(page).to have_content("Tracey Walter")

    expect(page).to have_content("Name: John Chard")  
    expect(page).to have_content("Rating: 8.0")   
    expect(page).to have_content("ID: 579b3420c3a3686e13000085")   
    expect(page).to have_content("URL: https://www.themoviedb.org/review/579b3420c3a3686e13000085")   

    expect(page).to have_content("Name: Albert")  
    expect(page).to have_content("Rating: 4.0")   
    expect(page).to have_content("ID: 599b09dfc3a3681dde000414")   
    expect(page).to have_content("URL: https://www.themoviedb.org/review/599b09dfc3a3681dde000414")  
  end
end