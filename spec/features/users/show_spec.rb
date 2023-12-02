require 'rails_helper'

describe 'User Dashboard Page' do
  before :each do
    test_data
    oppenheimer_test_data
    missing_poster_test_data
    placeholder_poster_test_data
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
    visit user_path(@user1)
  end

  it "has user's name at top of page" do
    expect(page).to have_content("Shawn's Dashboard")
    expect(page).to_not have_content("Anthea's Dashboard")
  end

  it 'has a button to discover movies' do
    expect(page).to have_button('Discover Movies')
  end

  describe "Viewing Parties" do
    it "has the movie poster" do
      expect(page).to have_css(".img")
    end

    it "shows the viewing parties that user has created" do  
      expect(page).to have_link("Oppenheimer")
      expect(page).to have_content("3h")
      expect(page).to have_content("January 1, 2024")
      expect(page).to have_content("4:00 PM")
      expect(page).to have_content("Hosting")
    end

    it "host only shows if user is not host" do
      expect(page).to_not have_content("Host: Shawn")
    end

    it "has the users who are invited" do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user3.name)
    end

    it "has Invited Guests in bold" do
      expect(html).to include('<b>Invited Guests</b>')
    end
  end

  describe "sad path" do
    it "will still load page if no poster is available" do
      visit user_movie_path(@user1, 1209375)
      expect(page).to have_content("The Creator")
      expect(page).to have_content("Vote: 0.0")
      expect(page).to have_content("Summary: Amid a future war")
    end
  end
end