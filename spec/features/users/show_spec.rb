require 'rails_helper'

RSpec.describe "User Show Page", type: :feature do
  let!(:andra) { User.create!(name: "Andra", email: "andra@turing.edu") }
  let!(:hady) { User.create!(name: "Hady", email: "hady@turing.edu") }

  let!(:halloween) { Party.create!(name: "Halloween Party", host_id: hady.id, party_date: "10/31/2023", party_time: "10:30", duration: 123) }
  let!(:girls_night) { Party.create!(name: "Girl's Night", host_id: hady.id, party_date: "01/01/2023", party_time: "02:00", duration: 210) }
  let!(:eighties) { Party.create!(name: "Eighties Themed", host_id: hady.id, party_date: "01/01/2023", party_time: "02:00", duration: 210) }
  let!(:other) { Party.create!(name: "Other", host_id: hady.id, party_date: "01/01/2023", party_time: "02:00", duration: 210) }

  let!(:usp1) { UserParty.create!(user_id: andra.id, party_id: halloween.id) }
  let!(:usp2) { UserParty.create!(user_id: andra.id, party_id: girls_night.id) }
  let!(:usp3) { UserParty.create!(user_id: andra.id, party_id: eighties.id) }
  
  before do
    visit "/users/#{andra.id}"
  end

  describe "When I visit '/users/:id'" do
    it "I see user's name at the top of the page" do
      expect(page).to have_content("Andra's Info")
    end

    it "I see a button to Discover Movies that directs to a discover page" do
      expect(page).to have_button("Discover Movies")

      click_button("Discover Movies")
      expect(current_path).to eq("/users/#{andra.id}/discover")
    end

    it "I see a section that lists viewing parties they've been invited to" do
      within "#viewing_parties" do
        expect(page).to have_content("Andra's Viewing Parties")

        expect(page).to have_content("Halloween Party")
        expect(page).to have_content("Girl's Night")
        expect(page).to have_content("Eighties Themed")
        expect(page).to_not have_content("Other")
      end
    end
  end
end