require "rails_helper"

RSpec.describe "User Registration", type: :feature do
  before(:each) do
    @stan = User.create!(name: "Stan Johnson", email: "stan@example.com")
    visit user_path(@stan)
  end

  describe "User Story 6" do
    describe "As a user, when I visit a users dashboard page(/users/:id})" do
      it "I should see the name of the user's dashboard " do
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
    end
  end
end
