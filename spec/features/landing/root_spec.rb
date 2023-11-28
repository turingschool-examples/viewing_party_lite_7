require "rails_helper"

RSpec.describe "Root" do
  before :each do
    test_data 
  end

  describe "When a user visits the root path they should be on the landing page ('/')" do
    it "includes title of application" do
      visit "/"
      expect(page).to have_content("Viewing Party Lite")
    end

    it "has button to create a new user" do
      visit "/"
      click_button("Create New User")
      expect(current_path).to eq("/users/new")
    end

    it "has list of existing users which links to user dashboard" do
      visit "/"
      expect(page).to have_content("Existing Users")
      expect(page).to have_content(@user1.email)
      expect(page).to have_content(@user2.email)
      expect(page).to have_content(@user3.email)
    end

    it "has link to go to landing page" do
      visit "/"
      click_link("Home")
      expect(current_path).to eq("/")
    end
  end
end