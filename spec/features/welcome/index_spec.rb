require "rails_helper"

RSpec.describe "Landing Page", type: :feature do
  describe "#index" do
    it "displays the title of the application" do
      visit root_path

      expect(page).to have_content("Viewing Party!")
    end

    it "has a button to create a new user" do
      visit root_path

      within "#new_user" do
        expect(page).to have_button("Create New User")
        click_button("Create New User")
      end
      expect(current_path).to eq(register_path)
    end
  end
end