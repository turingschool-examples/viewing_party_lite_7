require 'rails_helper'

RSpec.describe "User Show Page", type: :feature do
  let!(:andra) { User.create!(name: "Andra", email: "andra@turing.edu") }
  let!(:hady) { User.create!(name: "Hady", email: "hady@turing.edu") }
  let!(:mike) { User.create!(name: "Mike", email: "mky@turing.edu") }


  let!(:halloween) { Party.create!(name: "Halloween Party", user_id: hady.id, movie_id: 1, party_date: "10/31/2023", party_time: "10:30", duration: 123) }
  let!(:girls_night) { Party.create!(name: "Girl's Night", user_id: hady.id, movie_id: 2, party_date: "01/01/2023", party_time: "02:00", duration: 210) }
  let!(:eighties) { Party.create!(name: "Eighties Themed", user_id: hady.id, movie_id: 3, party_date: "01/01/2023", party_time: "02:00", duration: 210) }
  let!(:other) { Party.create!(name: "Other", user_id: hady.id, party_date: "01/01/2023", party_time: "02:00", duration: 210) }

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

    it "I see the viewing parties I've created" do
      VCR.use_cassette("top_rated_movies_dashboard") do
          @results = MoviesFacade.new.top_rated_movies
        
        visit "/users/#{hady.id}/movies/#{@results[0].movie_id}/parties/new"
        within("div#viewing_party_form") do 
          fill_in :name, with: "Fun Party"
          fill_in :duration, with: 180
          fill_in :party_date, with: "2023/01/01"
          fill_in :party_time, with: "10:00"

          within("div##{hady.name}") do
            check("invites[]", option: hady.id)
          end
          
          within("div##{mike.name}") do
            check("invites[]", option: mike.id)
          end

          click_button "Create Party"
        end
        
        within("div#host_parties") do
          expect(page).to have_content("Fun Party")
        end

        visit "/users/#{mike.id}"

        within("div#viewing_parties") do
          expect(page).to have_content("Fun Party")
          expect(page).to_not have_content("Halloween Party")
          expect(page).to_not have_content("Girl's Night")
          expect(page).to_not have_content("Eighties Themed")
          expect(page).to_not have_content("Other")
        end
      end
    end
  end
end