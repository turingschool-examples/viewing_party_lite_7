require "rails_helper"

RSpec.describe "Movies Results Page" do
  before do
    create_list(:user, 1)
    @user = User.first
  end
  
  it "has a title", :vcr do
    visit user_movies_path(@user)
    expect(page).to have_content("Movies Results Page")
  end

  it "displays top rated movies when queried for", :vcr do
    visit "users/#{@user.id}/movies?search=top_rated"

    expect(page).to have_css(".movie", count: 20)

    within(first(".movie")) do
      expect(page).to have_css(".title")
      expect(page).to have_css(".vote_average")
    end
  end

  it "displays movies which match keyword search", :vcr do
    visit "users/#{@user.id}/movies?search=holiday"

    expect(page).to have_css(".movie", count: 20)

    within(first(".movie")) do
      expect(page).to have_css(".title")
      expect(page).to have_css(".vote_average")
    end
  end

  it "links to the movie details page from the movie title", :vcr do
    visit "users/#{@user.id}/movies?search=top_rated"

    within(first(".movie")) do
      click_link
    end
    
    expect(current_path).to eq(user_movie_path(@user.id, 238))
  end

  it "has a button to return to the discover page", :vcr do
    visit "users/#{@user.id}/movies?q=top_rated"

    expect(page).to have_button("Discover Movies")

    click_button("Discover Movies")

    expect(current_path).to eq(user_discover_path(@user.id))
  end
end