require 'rails_helper'

RSpec.describe "user dashboard page", type: :feature do
  describe "display" do
    before do
      test_data
    end

    it "has user's name, a discover button, and a party viewing section" do
      visit "/users/#{@user_1.id}"

      expect(page).to have_content("User 1's Dashboard")
      expect(page).to have_button("Discover Movies")
      within("#parties") do
        expect(page).to have_content("This user has no parties yet")
      end

      click_button("Discover Movies")
      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end
  end
end
