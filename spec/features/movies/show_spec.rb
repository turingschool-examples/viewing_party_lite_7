require "rails_helper"

RSpec.describe "Movies show page" do
  before(:each) do
    @user3 = User.create!(name: "Action Jackson", email: "itsjack@aol.com")
  end

  it "should have a button that takes you to the viewing party page" do
    visit "/users/#{@user3.id}/movies/238"

    expect(page).to have_button("Create Viewing Party")
    click_button "Create Viewing Party"
    expect(current_path).to eq("/users/#{@user3.id}/movies/238/viewing_party")
  end

  it "should have a button that takes you to back to the Discover page" do
    visit "/users/#{@user3.id}/movies/238"

    expect(page).to have_button("Discover Page")
    click_button "Discover Page"
    expect(current_path).to eq("/users/#{@user3.id}/discover")
  end

  it "should display movie details" do
    visit "/users/#{@user3.id}/movies/238"

    expect(page).to have_content("The Godfather")
    expect(page).to have_content("8.7")
    expect(page).to have_content("175")
    expect(page).to have_content("Drama")
    expect(page).to have_content("Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.")
    expect(page).to have_content("Al Pacino")
    expect(page).to have_content("5")
    expect(page).to have_content("CinemaSerf")
    expect(page).to have_content("When you get a story written quite this magnificently")
  end
end

