require "rails_helper"

RSpec.describe "Movies Results Page" do
  before do
    create_list(:user, 1)
    @user = User.first

    visit user_movie_path(@user.id, 238)
  end

  xit "has a button to create a viewing party" do
    expect(page).to have_button("Create Viewing Party")

    click_button("Create Viewing Party")

    expect(current_path).to eq()
  end

  it "has a button to return to the discover page", :vcr do
    expect(page).to have_button("Return to Discover")

    click_button("Return to Discover")

    expect(current_path).to eq(user_discover_path(@user.id))
  end

  it "displays the movie title, vote average and runtime", :vcr do
    expect(page).to have_content("The Godfather")
    expect(page).to have_content(8.7)
    expect(page).to have_content(175)
  end

  it "displays associated genres and summary description", :vcr do
    expect(page).to have_content("Drama")
    expect(page).to have_content("Crime")
    expect(page).to have_content("Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.")

  end

  it "lists the first 10 cast members' names and characters", :vcr do
    expect(page).to have_css(".cast_member", count: 10)

    within(first(".cast_member")) do
      expect(page).to have_content("Marlon Brando")
      expect(page).to have_content("Don Vito Corleone")
    end
  end

  it "displays the total review count, each review's author and info", :vcr do
    expect(page).to have_css(".review")

    within(first(".review")) do
      expect(page).to have_content("futuretv")
      expect(page).to have_content(10.0)
    end
  end
end