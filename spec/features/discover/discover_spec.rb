require "rails_helper"

RSpec.describe "/users/:id/discover", type: :feature do

  let!(:user_1) { create(:user) }

  describe "As a visitor" do
    describe "When I visit the user's discover page" do


      it "displays a button to Discover Top Rated Movies" do
        visit "/users/#{user_1.id}/discover"
        expect(page).to have_button("Discover Top Rated Movies")
        click_button "Discover Top Rated Movies"
        expect(current_path).to eq("/users/#{user_1.id}/movies")
        # visit the page
        # expect the page to have the button "Discover Top Rated Movies"
        # click button
        # expect current_path to be X
      end

      it "has a text field and button to enter keywords and search by movie title" do
        visit "/users/#{user_1.id}/discover"
        expect(page).to have_field("Search For Movies")
        expect(page).to have_button("Search For Movie")

        fill_in("Search For Movie", with: "V for Vendetta")
        click_button "Search For Movie"

        expect(current_path).to eq("/users/#{user_1.id}/movies")
      end

      # it "has a button to search by movie title" do
      #   # visit "/users/#{user_1.id}/discover"
      #   # expect(page).to have_button("Search For Movie By Title")
      #   # click_button "Search For Movie By Title"
      #   # expect(current_path).to eq("users/:user_id/movies")
      # end
    end
  end

end