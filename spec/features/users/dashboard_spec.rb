require "rails_helper"

RSpec.describe "User Dashboard Page", type: :feature do
  before(:each) do
    @user = User.create(name: "Brad", email: "bradsmith@gmail.com")
    @viewing_party = @user.viewing_parties.create(duration: 180, day: "December 2, 2023", view_time: "7:00 pm")
  end
  describe "when I visit 'users/:id'" do
    it "I should see 'User's Name Dashboard' at the top of the page, a button to discover movies, and a section that lists viewing parties" do
      visit "/users/#{@user.id}"

      expect(page).to have_content("Brad's Dashboard")

      expect(page).to have_button("Discover Movies")

      within("#viewing_parties") do
        expect(page).to have_content("#{@viewing_party.day}")
        expect(page).to have_content("#{@viewing_party.view_time}")
      end
    end

    it "When I click 'Discover Movies' button I am redirected to a discover page /users/:id/discover where the :id is the current user id" do
      visit "/users/#{@user.id}"

      click_button "Discover Movies"

      expect(current_path).to eq("/users/#{@user.id}/discover")
    end
  end
end