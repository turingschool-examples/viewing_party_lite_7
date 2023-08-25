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
  end
end