require 'rails_helper'

RSpec.describe "Movie Details Page" do 
  it "exists", :vcr do 
    user = User.last

    visit "/users/#{user.id}/movies/872585"

    expect(page).to have_content("Viewing Party")
    expect(page).to have_link("Home")
    expect(page).to have_button("Discover Page")
    expect(page).to have_button("Create Viewing Party for Oppenheimer")
  end

  it "has details particular to a given movie", :vcr do 
    user = User.last

    visit "/users/#{user.id}/movies/872585"

    expect(page).to have_content 
  end
end