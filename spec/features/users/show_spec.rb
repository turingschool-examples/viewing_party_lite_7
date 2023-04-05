require "rails_helper"

RSpec.describe "User Registration", type: :feature do
  before(:each) do
    @stan = User.create!(name: "Stan Johnson", email: "stan@example.com", password: "test123", password_confirmation: "test123")
    @ben = create(:user, password: "test123", password_confirmation: "test123")
    @sarah = create(:user, password: "test123", password_confirmation: "test123")
    @jill = create(:user, password: "test123", password_confirmation: "test123")

    @my_party = create(:party, host_id: @stan.id, movie_id: 550, day: "2023-03-26", time: "20:00")
    @their_party = create(:party, host_id: @ben.id, movie_id: 550, day: "2023-03-31", time: "19:00")

    UserParty.create!(user_id: @stan.id, party_id: @my_party.id)
    UserParty.create!(user_id: @ben.id, party_id: @my_party.id)
    UserParty.create!(user_id: @sarah.id, party_id: @my_party.id)
    UserParty.create!(user_id: @jill.id, party_id: @my_party.id)

    UserParty.create!(user_id: @stan.id, party_id: @their_party.id)
    UserParty.create!(user_id: @ben.id, party_id: @their_party.id)
    UserParty.create!(user_id: @sarah.id, party_id: @their_party.id)
    UserParty.create!(user_id: @jill.id, party_id: @their_party.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@stan)
    
    visit user_path(@stan)
  end

  describe "User Story 6", :vcr do
    describe "As a user, when I visit a users dashboard page(/users/:id})" do
      it "I should see the name of the user's dashboard" do
        expect(page).to have_content("#{@stan.name}'s Dashboard")
      end

      it "has a button to 'Discover Movies'" do
        expect(page).to have_button "Discover Movies"
      end

      it "has a section that shows all viewing parties" do
        within "#viewing_parties" do
          expect(page).to have_content("Viewing Parties")
        end
      end

      it "when I click the 'Discover Movies' button, I am routed to the discover page" do
        click_button "Discover Movies"

        expect(current_path).to eq("/users/#{@stan.id}/discover")
      end

      it "I will see my viewing parties details, details of viewing parties I am invited to, and the movie title and img" do
        
        within "#party-#{@my_party.id}" do
          expect(page).to have_css("img")
          expect(page).to have_link("Fight Club")
          expect(page).to have_content("Date: March 26, 2023")
          expect(page).to have_content("Time: 08:00 PM")
          expect(page).to have_content("Host: #{@stan.name}")
          within "ul#guests" do
            expect(page).to have_content("#{@ben.name}")
            expect(page).to have_content("#{@sarah.name}")
            expect(page).to have_content("#{@jill.name}")
          end
        end

        within "#party-#{@their_party.id}" do
          expect(page).to have_css("img")
          expect(page).to have_link("Fight Club")
          expect(page).to have_content("Date: March 31, 2023")
          expect(page).to have_content("Time: 07:00 PM")
          expect(page).to have_content("Host: #{@ben.name}")
          within "ul#guests" do
            expect(page).to have_content("#{@stan.name}")
            expect(page).to have_content("#{@sarah.name}")
            expect(page).to have_content("#{@jill.name}")
          end
        end
      end
    end
    
    describe "User Story 4 - as a visitor when I try to visit movie show page" do
      describe "I click the button to create a viewing party" do
        it "I'm redirected to the movies show page, and a message appears to let me know I must be logged in or registered to create a movie party." do
          visit user_movie_path(@stan.id, 550)
          click_button "Create Viewing Party"
          expect(page).to have_content("You must be logged in to view this page!")
        end
      end
    end
  end
end