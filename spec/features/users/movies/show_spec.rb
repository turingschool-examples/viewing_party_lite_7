require "rails_helper"

RSpec.describe "Movies Show" do
  before :each do
    test_data 
  end

  it "It should have a button to create a viewing party and a button to return to the discover page", :vcr do
    visit "/users/#{@user1.id}/discover"

    fill_in :movie_title, with: "Shrek"
    click_button "Find Movies"
    click_link("Shrek", match: :first)
    expect(current_path).to eq("/users/#{@user1.id}/movies/808")
    
    expect(page).to have_button("Create Viewing Party for Shrek")
    click_button "Discover Page"
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  it "It should have Movie Title
  Vote Average of the movie
  Runtime in hours & minutes
  Genre(s) associated to movie
  Summary description
  List the first 10 cast members (characters&actress/actors)
  Count of total reviews
  Each review's author and information", :vcr do

    visit "/users/#{@user1.id}/movies/808"
    
    # expect(page).to have_content("Shrek")
    # expect(page).to have_content("The Swan Princess: Far Longer Than Forever")
    # expect(page).to have_content("A Winter Princess")
    # expect(page).to have_content("One Piece: The Desert Princess and the Pirates: Adventure in Alabasta")
    

  end



end