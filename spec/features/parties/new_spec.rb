require "rails_helper"

RSpec.describe "New Party" do
  before :each do
    test_data 
  end

  it "can create a new party with all attributes", :vcr do
    visit "/users/#{@user1.id}/movies/808"

    click_button "Create Viewing Party for Shrek"
    expect(current_path).to eq("/users/#{@user1.id}/movies/808/viewing-party/new")
    
    expect(page).to have_content("Create a Movie Party for Shrek")
    expect(page).to have_button("Discover Page")
    expect(page).to have_content("Viewing Party Details")
    expect(page).to have_content("Movie Title")
    expect(page).to have_content("Shrek")
    expect(page).to have_content("Duration of Party")
    expect(page).to have_content("90")
    expect(page).to have_content("Day")
    expect(page).to have_content("Start Time")
    expect(page).to have_content("Invite Other Users")
    
    expect(page).to have_content("#{@user2.name} (#{@user2.email})")
    expect(page).to have_content("#{@user3.name} (#{@user3.email})")
    
    fill_in "Duration of Party", with: 100
    fill_in "Day", with: "1/1/2024"
    fill_in "Time", with: "7:00"
    
    page.check "#{@user3.name}"
    
    click_button "Create Party"
    
    expect(current_path).to eq("/users/#{@user1.id}")
    expect(page).to have_content("Shrek")
    expect(page).to have_content("January 1, 2024")
    expect(page).to have_content("7:00 pm")
    expect(page).to have_content("Hosting")

    visit "/users/#{@user3.id}"
    expect(page).to have_content("Shrek")
    expect(page).to have_content("January 1, 2024")
    expect(page).to have_content("7:00 pm")
    expect(page).to have_content("Invited")

    visit "/users/#{@user2.id}"
    expect(page).to_not have_content("Shrek")

  end
end