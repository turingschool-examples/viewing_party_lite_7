require "rails_helper"

RSpec.describe "Movie Results Page" do
  before(:each) do
    @user = User.create(name: "Brad", email: "bradsmith@gmail.com")
  end

  it "I see a button to return to the discover page" do
    visit "/users/#{@user.id}/discover"
    click_button "Find Top Rated Movies"

    expect(page).to have_button("Discover Page")
    click_button "Discover Page"

    expect(current_path).to eq("/users/#{@user.id}/discover")
  end

  it "I see the top 20 top rated movies when top movies button is pressed, their name as a link to their detail page and the vote average of the movie" do
    VCR.use_cassette("top_20_rated_movies") do
      visit "/users/#{@user.id}/discover"

      click_button "Find Top Rated Movies"
      expect(current_path).to eq("/users/#{@user.id}/movies")

      within("#238") do
        expect(page).to have_link("The Godfather")
        expect(page).to have_content("Vote Average: 8.7")
      end

      within("#11216") do
        expect(page).to have_link("Nuovo Cinema Paradiso")
        expect(page).to have_content("Vote Average: 8.5")
      end

      click_link "Nuovo Cinema Paradiso"

      expect(current_path).to eq("/users/#{@user.id}/movies/11216")
    end
  end
end