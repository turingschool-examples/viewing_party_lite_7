require "rails_helper" 

RSpec.describe "Movie Results Page" do 
  before(:each) do 
    @user1 = User.create!(name: "Wolfie", email: "wolfie@gmail.com")
  end
  describe "search results" do 
    it "displays search results for a keyword/title search" do 
      visit "/users/#{@user1.id}/discover"
      fill_in "keyword", with: "Jaws"
      click_button "Search"

      expect(current_path).to eq("/users/#{@user1.id}/movies")
      
      # stub this below
      # within("#results") do 
      #   expect(page).to have_content()
      # end
    end
    
    it "has a button to return to the discover page" do 
      visit "/users/#{@user1.id}/movies"
      click_button "Discover Movies" 
      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end
  end
end