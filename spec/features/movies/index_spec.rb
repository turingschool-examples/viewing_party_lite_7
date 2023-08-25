require "rails_helper"

RSpec.describe "the movie index page" do
  before(:each) do
    @user3 = User.create!(name: "Action Jackson", email: "itsjack@aol.com")
  end
  
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

  it "should have a button that takes you to back to the Discover page" do
    visit "/users/#{@user3.id}/movies"

    expect(page).to have_button("Discover Page")
    click_button "Discover Page"
    expect(current_path).to eq("/users/#{@user3.id}/discover")
  end
end