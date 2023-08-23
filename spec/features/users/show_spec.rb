require "rails_helper"

RSpec.describe "user show page" do
  before(:each) do
    @user1 = User.create!(name: "Flick Chick", email: "flick@yahoo.com")
    @user2 = User.create!(name: "Rom Com Ron", email: "comron@yahoo.com")
    @user3 = User.create!(name: "Action Jackson", email: "itsjack@aol.com")

    @vp1 = ViewingParty.create!(duration: 90, date: "08-01-2023", start_time: "8 PM")
    @vp2 = ViewingParty.create!(duration: 130, date: "09-03-2023", start_time: "4 PM")

    UserViewingParty.create!(user: @user3, viewing_party: @vp1)
    UserViewingParty.create!(user: @user3, viewing_party: @vp2)
  end
  
  it "displays user information" do
    visit user_path(@user3)

    expect(page).to have_content("Action Jackson's Dashboard")
  end

  it "displays a button to discover movies" do
    visit user_path(@user3)

    expect(page).to have_button "Discover Movies"
  end

  it "displays a section that lists viewing parties" do
    visit user_path(@user3)

    expect(page).to have_content("at 8 PM")
    expect(page).to have_content("at 4 PM")
    expect(page).to have_content("130 minutes long")
  end
end