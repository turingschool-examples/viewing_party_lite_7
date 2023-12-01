require 'rails_helper'

describe 'User Dashboard' do
  before :each do
    test_data
    visit user_dashboard_path(@user1, @user2)
  end

  xit "shows the viewing parties that user is invited to" do
    #expect(page).to have_content(@party1.movie_image)
    expect(page).to have_content(@party1.movie_title)
    expect(page).to have_content(@party1.duration_in_hours_and_minutes)
    expect(page).to have_content("January 21, 2023")
    expect(page).to have_content("8:00pm")
    expect(page).to have_content("Invited")
  end

  xit "shows viewing parties that user has created" do
    # expect(page).to have_content(@party3.movie_image)
    expect(page).to have_content(@party3.movie_title)
    expect(page).to have_content("3h 0min")
    expect(page).to have_content("January 1st, 2000")
    expect(page).to have_content("9:00")
    expect(page).to have_content("Hosting")
  end
end