require "rails_helper"

RSpec.describe "Dashboard Show Page" do
  describe "show" do 
    scenario "when I visit 'users/:id', I see data" do 
      u1 = User.create!(name: "Sean", email: "champion4lyfe@gmail.com")

      visit user_path(u1)

      expect(page).to have_content("#{u1.name}'s Dashboard")
      
      find_button("Discover Movies")
  
      within("#viewing") do 
        expect(page).to have_content("Viewing Parties")
      end
    end

      #US 7
    scenario "When I visit 'users/:id', I click a button to discover movies" do
      u1 = User.create!(name: "Sean", email: "champion4lyfe@gmail.com")

      visit user_path(u1)

      click_button("Discover Movies")
      
      #Redirects to the user discover index page
      expect(current_path).to eq(user_discover_index_path(u1))
    end
  end
end