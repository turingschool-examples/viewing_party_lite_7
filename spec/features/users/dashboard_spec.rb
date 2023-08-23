require 'rails_helper'

RSpec.describe "User Dashboard" do
  before do
    @user1 = User.create!(name: "Marvin", email: "Marvin@gmail.com")
    @viewing_party1 = @user1.viewing_parties.create!(name: "Marvin's Pulp Fiction Party", movie_title: "Pulp Fiction", host: "Marvin", event_date: "8/22/23", start_time: "1" )
  end

  describe "user dashboard show" do
    it "displays the users name at the top of the page" do
      visit user_path(@user1)
      expect(page).to have_content("#{@user1.name}'s Dashboard")
      expect(page).to have_button("Discover Movies")
      expect(page).to have_content(@viewing_party1.name)
    end

    it "redirects me to users discover page when I click discover movies button" do
      visit user_path(@user1)
      click_button "Discover Movies"
      
      expect(current_path).to eq(discover_user_path(@user1))
    end
  end
end