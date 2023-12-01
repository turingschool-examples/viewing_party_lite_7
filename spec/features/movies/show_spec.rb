require 'rails_helper'

RSpec.describe 'Movie Details Page' do
  before(:each) do
    load_test_data
  end
  it 'When I go to a user dashbaord, and click "Discover Movies" button, I am redirected to a discover page /users/:id/discover', :vcr do

    visit "/users/#{@user1.id}/movies/268"
    expect(page).to have_button('Create a Viewing Party')
    expect(page).to have_link('Return to Discover Page')
    
    expect(page).to have_content("Movie Id: 268")

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

    expect(page).to have_content("Review Count:")

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

