require "rails_helper"

RSpec.describe "the /register page", type: :feature do
  describe "When a user visits the register path they should see a form to register" do
    it "the form should include: name, email(unique), register button" do
      visit "/register"

      fill_in "Name", with: "John Smith"
      fill_in "Email", with: "jsmith@aol.com"
      click_button "Register"

      expect(current_path).to eq("/users/#{User.all.last.id}")
    end
  end
end