require "rails_helper"

RSpec.describe "Dashboard Page" do 
  before(:each) do 
    @user_1 = User.create!(name: "Joe Smith", email: "joey_smithy@yahooey.com")
    @user_2 = User.create!(name: "Sam Smith", email: "sam_smithy@yahooey.com")

    @viewing_party_1 = ViewingParty.create!(duration_of_party: 300, when: "2023-12-25", start_time: "10:10")
    @viewing_party_2 = ViewingParty.create!(duration_of_party: 280, when: "2439-10-31", start_time: "11:48")

    @user_1.viewing_party_users.create!(viewing_party: @viewing_party_1, is_host: false)
    @user_1.viewing_party_users.create!(viewing_party: @viewing_party_2, is_host: true)

    visit user_path(@user_1)
  end

  describe "when visiting the user's dashboard" do 
    it "I should see my name in possesive of dashboard" do 
      expect(page).to have_content("#{@user_1.name}'s Dashboard")
    end

    it "And has a button to discover movies" do 
      expect(page).to have_button("Discover Movies")
    end

    it "And has a section that lists viewing parties" do 
      within(".viewing_parties") do
        expect(page).to have_content("2023-12-25")
        expect(page).to have_content("10:10")
        expect(page).to have_content("2439-10-31")
        expect(page).to have_content("11:48")
      end
    end

    it "Redirects to the discover page after clicking 'Discover Movies'" do
      click_button "Discover Movies"
      
      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end
  end
end