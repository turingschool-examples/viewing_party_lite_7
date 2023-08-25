require 'rails_helper'

RSpec.describe "User Movies Show" do 
  it "has a button to return to discover" do 
    aquaria = User.create!(name: "Aquaria", email: "Aquariahoe@hotmess.com")
    

    visit user_movie_path(aquaria, 238)

    expect(page).to have_button("Discover")

    click_on "Discover"

    expect(current_path).to eq(user_discover_path(aquaria))
  end

  xit "has a button to create a viewing party" do 

  end

  it "displays movie details", :vcr do
    aquaria = User.create!(name: "Aquaria", email: "Aquariahoe@hotmess.com")
    

    overview = "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge."

    visit user_movie_path(aquaria, 238)

    expect(page).to have_content("Title: The Godfather")
    expect(page).to have_content("Average Rating: 8.7")
    expect(page).to have_content("Runtime: 2:55")
    expect(page).to have_content("Genre: Drama Crime")
    expect(page).to have_content(overview)
    expect(page).to have_content("Marlon Brando, Don Vito Corleone")
    expect(page).to have_content("John Marley, Jack Woltz")
    expect(page).to have_content("Total Reviews: 5")
    expect(page).to have_content("Author: Suresh Chidurala")
    expect(page).to have_content("Username: Suresh17511")
    expect(page).to have_content("Rating: 9.0")
  end
end
