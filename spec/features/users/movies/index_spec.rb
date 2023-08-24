require 'rails_helper'

RSpec.describe "User Movies Index Page" do
  it "has top rated movies", :vcr do
    aquaria = User.create!(name: "Aquaria", email: "Aquariahoe@hotmess.com")

    visit user_movies_path(aquaria)

    expect(page).to have_content("The Godfather")
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content("The Godfather Part II")
    expect(page).to have_content("Schindler's List")
    expect(page).to have_content("Dilwale Dulhania Le Jayenge")
  end
end