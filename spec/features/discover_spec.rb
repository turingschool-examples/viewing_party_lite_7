require "rails_helper"

RSpec.describe "Discover page" do
  before(:each) do
    @user3 = User.create!(name: "Action Jackson", email: "itsjack@aol.com")
  end
  it "should have button for top rated movies and search button" do
    visit "/users/#{@user3.id}/discover"

    expect(page).to have_content "Discover Movies!"
    expect(page).to have_button "Find Top Rated Movies"
    expect(page).to have_field("Search")
    expect(page).to have_button "Find Movies"
  end

  it "Find Top Rated Movies button takes us to movies results page " do
    visit "/users/#{@user3.id}/discover"
    
    expect(page).to have_content "Discover Movies!"
    expect(page).to have_button "Find Top Rated Movies"
    click_button "Find Top Rated Movies"
    expect(current_path).to eq("/users/#{@user3.id}/movies")
  end

  it "Search takes us to movies results page " do
    visit "/users/#{@user3.id}/discover"
    
    expect(page).to have_field("Search")
    fill_in "Search", with: "Spiderman"
    expect(page).to have_button "Find Movies"
    click_button "Find Movies"
    expect(current_path).to eq("/users/#{@user3.id}/movies")
  end
end