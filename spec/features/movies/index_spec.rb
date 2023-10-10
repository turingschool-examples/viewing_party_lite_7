require "rails_helper"

RSpec.describe "the /users/:id/discover page", type: :feature do
  describe "When a user visits the discover path" do
    it "has a button to find top rated movies, a text field to enter keywords, a button to search by movie title based on keywords" do
      visit "/register"

      fill_in "Name", with: "John Smith"
      fill_in "Email", with: "jsmith@aol.com"
      click_button "Register"

      expect(current_path).to eq("/users/#{User.all.last.id}")
    end
  end
end