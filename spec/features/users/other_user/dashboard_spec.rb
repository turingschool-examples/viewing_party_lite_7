require 'rails_helper'

describe 'User Dashboard' do
  before :each do
    test_data
    oppenheimer_test_data

    visit new_user_movie_viewing_party_path(@user1, 872585)
    host_id = @user1.id
    fill_in :day, with: "2024-01-01"
    fill_in :start_time, with: "04:00 PM"
    fill_in :duration, with: "200"

    within("#invited_user-#{@user2.id}") do
      check("invitees[]")
    end
    within("#invited_user-#{@user3.id}") do
      check("invitees[]")
    end 
    click_button "Create Party"
    visit user_dashboard_path(@user1, @user2)
  end

  it "has the movie poster" do
    expect(page).to have_css(".img")
  end

  it "shows the viewing parties that user is invited to" do  
    expect(page).to have_link("Oppenheimer")
    expect(page).to have_content("3h")
    expect(page).to have_content("January 1, 2024")
    expect(page).to have_content("4:00 PM")
    expect(page).to have_content("Invited")
  end

  it "has the host listed" do
    expect(page).to have_content("Host: Shawn")
  end

  it "has the users who are invited" do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
  end

  it "shows viewing parties that user has created" do
    visit user_dashboard_path(@user2, @user1)
    expect(page).to have_link("Oppenheimer")
    expect(page).to have_content("3h")
    expect(page).to have_content("January 1, 2024")
    expect(page).to have_content("4:00 PM")
    expect(page).to have_content("Hosting")
  end
end