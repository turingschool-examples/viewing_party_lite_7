require 'rails_helper'

describe 'User Dashboard' do
  before :each do
    test_data
    visit user_dashboard_path(@user1, @user2)
  end

  it "has the movie poster" do
    expect(page).to have_css(".img")
  end

  xit "shows the viewing parties that user is invited to" do
    expect(page).to have_link(@party1.movie_title)
    expect(page).to have_content(@party1.duration_in_hours_and_minutes)
    expect(page).to have_content(@party1.pretty_day)
    expect(page).to have_content(@party1.pretty_time)
    expect(page).to have_content("Invited")
  end

  it "has the host listed" do
    expect(page).to have_content("Host: #{@party1.host}")
  end

  xit "has the users who are invited" do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
  end

  it "shows viewing parties that user has created" do
    expect(page).to have_link(@party3.movie_title)
    expect(page).to have_content(@party3.duration_in_hours_and_minutes)
    expect(page).to have_content(@party3.pretty_day)
    expect(page).to have_content(@party3.pretty_time)
    expect(page).to have_content("Hosting")
  end
end