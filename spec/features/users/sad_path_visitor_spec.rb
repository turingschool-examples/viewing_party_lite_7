require "rails_helper"

RSpec.describe "Sad Path Visitor" do
  describe "as a visitor" do
    it "Errors if trying to visit dashboard while not logged in" do
      visit root_path

      expect(current_path).to eq(root_path)

      visit dashboard_path

      expect(current_path).to eq(root_path)
      expect(page).to have_content("You must be logged in to visit that page.")
    end
  end
end