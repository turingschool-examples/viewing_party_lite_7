require 'rails_helper'

RSpec.describe "User Dashboard" do
  before do
    @user1 = User.create!(name: "Marvin", email: "Marvin@gmail.com")
    @viewing_party1 = @user1.viewing_parties.create!(name: "Marvin's Pulp Fiction Party", movie_title: "Pulp Fiction", host: "Marvin", event_date: "8/22/23", start_time: "1" )
  end
  # When I visit '/users/:id' where :id is a valid user id,
  # I should see:

  # "<user's name>'s Dashboard" at the top of the page
  # A button to Discover Movies*
  # A section that lists viewing parties**
  # *more instructions on this in the Dashboard:Discover Movies issue.
  # **more instructions on this in the Dashboard:Viewing Parties issue.

  describe "user dashboard show" do
    it "displays the users name at the top of the page" do
      visit user_path(@user1.id)
      save_and_open_page
      expect(page).to have_content("#{@user1.name} Dashboard")
      expect(page).to have_button("Discover Movies")
      expect(page).to have_content(@viewing_party1.name)
    end
  end
end