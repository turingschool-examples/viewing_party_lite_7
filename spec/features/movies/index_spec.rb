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
    visit "users/#{@user.id}/movies?q=top-rated"

    expect(page).to have_css(".movie", count: 20)

    within(first(".movie")) do
      expect(page).to have_css(".title")
      expect(page).to have_css(".vote_average")
    end
  end

  it "displays movies which match keyword search" do
    
  end
end