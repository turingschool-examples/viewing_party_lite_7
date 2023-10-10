require "rails_helper"

RSpec.describe "User Dashboard Page", type: :feature do
  describe "when I visit 'users/:id'" do
    it "I should see 'User's Name Dashboard' at the top of the page, a button to discover movies, and a section that lists viewing parties" do
      user = User.create(name: "Brad", email: "bradsmith@gmail.com")
      viewing_party = user.viewing_parties.create(duration: 180, day: "December 2, 2023", view_time: "7:00 pm")

      visit "/users/#{user.id}"

      expect(page).to have_content("Brad's Dashboard")

      expect(page).to have_button("Discover Movies")

      within("#viewing_parties") do
        expect(page).to have_content("December 2, 2023")
        expect(page).to have_content("7:00 pm")
      end
    end
  end
end