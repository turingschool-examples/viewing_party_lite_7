require 'rails_helper'

RSpec.describe 'Movie Results' do
  before(:each) do
    load_test_data
  end
  it 'When I go to a user dashbaord, and click "Discover Movies" button, I am redirected to a discover page /users/:id/discover' do

    visit "/users/#{@user1.id}/movies/268"
    click_link "Go to Landing Page"
    expect(current_path).to eq("/")

    visit "/users/#{@user1.id}/movies/268"
    click_button "Create a Viewing Party"
    expect(current_path).to eq("/users/#{@user1.id}/movies/268/viewing-party/new")

    visit "/users/#{@user1.id}/movies/268"
    click_button "Discover Movies"
    expect(current_path).to eq(user_discover_index_path(user_id: @user1.id))

    # stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=2c14ab06be3bfe4ca5fecd0f9b2c73fc").
    # to_return(status: 200, body: "Your mock response data here")


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

    expect(page).to have_content("Review Count: 7")
    
  end
end

