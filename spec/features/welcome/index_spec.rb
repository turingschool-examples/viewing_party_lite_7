require 'rails_helper'

RSpec.describe 'Welcome Index Page', type: :feature do
  before(:each) do
    user1 = User.create!(name: "Timmy Turner", email: "timmyturner1@gmail.com")
    user2 = User.create!(name: "Wanda", email: "ilovecosmo1@gmail.com")
    user3 = User.create!(name: "Cosmo", email: "ilovewanda1@gmail.com")
  end
  
  # User story "Landing Page"
  describe "When a user visits the root path they should be on the landing page ('/')" do
    it "includes Title of Application, Button to Create a New User, List of Existing Users
      which links to the users dashboard, Link to go back to the landing page
      (this link will be present at the top of all pages)" do
      visit "/"
      expect(page).to have_content("Title of Application:")
      expect(page).to have_content("Create a New User")
      expect(page).to have_content("Existing Users:")
      expect(page).to have_content("Timmy Turner")
      expect(page).to have_content("Wanda")
      expect(page).to have_content("Cosmo")
      expect(page).to have_content("Back to Welcome Page")
    end

    it "link to back to welcome page takes you back to the landing page" do
      visit "/"
      
      click_link "Back to Welcome Page"
      expect(current_path).to eq("/")
    end
  end
end