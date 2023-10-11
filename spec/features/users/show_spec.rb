require "rails_helper"

RSpec.describe "user show page", type: :feature do
  before :each do
    @user_1 = User.create!(name: "Jamie", email: "34@gmail.com")
    @user_2 = User.create!(name: "Katie", email: "34997@gmail.com")
    @viewing_party_1 = ViewingParty.create!(duration: 180, date: 05/14/2023, start_time: "07:00:00", movie_id: 3)
    @user_party = UserViewingParty.create!(user: @user_1, viewing_party: @viewing_party_1)
    @user_party = UserViewingParty.create!(user: @user_2, viewing_party: @viewing_party_1)
    
    visit "/users/#{@user_1.id}"
  end

  feature "As a user" do
    feature "When I access my user show page" do
      scenario "I see the user's name, a button to discover movies and a list of viewing parties" do
        expect(page).to have_content("#{@user_1.name}'s Dashboard")
        expect(page).to have_content("User email: #{@user_1.email}")
        expect(page).to have_button("Discover Movies")
        within (".parties") do
          expect(page).to have_content("Viewing Party List")
        end
      end
    end
  end
  
end
    