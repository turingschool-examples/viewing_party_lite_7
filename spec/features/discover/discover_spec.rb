require "rails_helper"

RSpec.describe "/users/:id/discover" do

  describe "As a visitor" do
    describe "When I visit the user's discover page" do
      let!(:user_1) { create(:user) }

      it "displays a button to Discover Top Rated Movies" do
        visit "/users/#{user_1.id}/discover"
        expect(page).to have_button("Discover Top Rated Movies")
        click_button "Discover Top Rated Movies"
        expect(current_path).to be ("")
        # visit the page
        # expect the page to have the button "Discover Top Rated Movies"
        # click button
        # expect current_path to be X
      end

      it "has a text field to enter keywords to search by movie title"

      it "has a button to search by movie title"

    end
  end

end