require "rails_helper"

RSpec.describe "the movie results page" do
  before(:each) do
    @user3 = User.create!(name: "Action Jackson", email: "itsjack@aol.com")
  end
  # When I visit the discover movies page,
  # and click on either the Top Movies button or the Search button,
  # I should be taken to the movies results page (users/:user_id/movies) where I see:
  
  # Title (As a Link to the Movie Details page)
  # Vote Average of the movie
  # Details: There should only be a maximum of 20 results. The above details should be listed for each movie.
  
  # I should also see a button to return to the Discover Page.
  it "displays the movie title as a link to the movie details page" do
    visit "/users/#{@user3.id}/movies"

    expect(page).to have_link("The Godfather")
    expect(page).to_not have_link("Elemental")
    expect(page).to have_link count:21
  end

  it "can return a list of like names from search" do
    visit "/users/#{@user3.id}/discover"

    fill_in "Search", with: "Spider"

    click_button "Find Movies"

    expect(current_path).to eq("/users/#{@user3.id}/movies")

    expect(page).to have_content("Spider-Man: Across the Spider-Verse")
  end

  it "the links take us to the movie show page" do
    visit "/users/#{@user3.id}/movies"

    click_link "The Godfather"
    
    expect(current_path).to eq("/users/#{@user3.id}/movies/238")
  end
end