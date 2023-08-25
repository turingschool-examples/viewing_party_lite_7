require 'rails_helper'

RSpec.describe "User Dashboard" do
  before do
    @user1 = User.create!(name: "Marvin", email: "Marvin@gmail.com")
    @user2 = User.create!(name: "Vincent", email: "VincentVega@gmail.com")
    @viewing_party1 = @user1.viewing_parties.create!(name: "Marvin's Pulp Fiction Party", movie_title: "Pulp Fiction", host: "Marvin", event_date: "2023-08-28", start_time: "1:00 AM" )
    @viewing_party2 = @user2.viewing_parties.create!(name: "Vincent's 5 Dollar Shake Party", movie_title: "Shake it", host: "Vincent", event_date: "2023-08-29", start_time: "2:00 PM" )
    @viewing_party3 = @user2.viewing_parties.create!(name: "Butch's Watch Polishing Party", movie_title: "Watches a Documentary", host: "Vincent", event_date: "2023-08-23", start_time: "3:00 AM" )
    @user1.viewing_parties << @viewing_party2
    @user1.viewing_parties << @viewing_party3
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

    it "displays the viewing parties that the user has been invited to and created" do
      visit user_path(@user1)

      viewing_parties = [@viewing_party1, @viewing_party2, @viewing_party3]

      viewing_parties.each do |party|
        expect(page).to have_content(party.movie_title)
        expect(page).to have_content(party.event_date.strftime("%A, %B %d, %Y"))
        expect(page).to have_content(party.start_time)
        expect(page).to have_content(party.host)

        party.users.each do |user|
          expect(page).to have_content(user.name)
        end
      end
    end
  end
end