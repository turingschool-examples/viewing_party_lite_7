require 'rails_helper'

RSpec.describe "Users Show page", type: :feature do
  describe "When I visit the users show page" do
    before(:each) do
      @user_1 = User.create!(name: "Kiwi", email: "kiwibird@gmail.com")

      visit "/users/#{@user_1.id}"
    end

    it "I see the page title" do
      expect(page).to have_content("#{@user_1.name}'s Dashboard")
    end

    it "has a button to discover movies" do
      expect(page).to have_button("Discover Movies")

      click_button("Discover Movies")
      expect(page).to have_current_path("/users/#{@user_1.id}/discover")
    end

    it "has a section for viewing parties" do
      expect(page).to have_css("#parties")
    end
  end
end