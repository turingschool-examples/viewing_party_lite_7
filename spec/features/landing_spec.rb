require 'rails_helper'

RSpec.describe 'Landing Page' do 
  describe "visit the root path" do 
    it "displays the title of the application, create new user button, list of users, homepage link" do 
      monet = User.create!(name: "Monet Xchange", email: "Monet_Xchange@hotmess.com")
      bob = User.create!(name: "Bob the Dragqueen", email: "Bobthehoe@hotmess.com")
      aquaria = User.create!(name: "Aquaria", email: "Aquariahoe@hotmess.com")

      visit root_path
      
      expect(page).to have_content("Viewing Party")
      expect(page).to have_button("Create New User")
      expect(page).to have_content("Existing Users")

      expect(page).to have_link("Aquaria")
      click_link("Aquaria")
      expect(current_path).to eq(user_path(aquaria))
    end
  end
end