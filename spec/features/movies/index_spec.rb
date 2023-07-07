require "rails_helper" 

RSpec.describe "Discover Movies Page", type: :feature do 
  before(:each) do 
    @user1 = User.create!(name: "Wolfie", email: "wolfie@gmail.com")
    visit "/users/#{@user1.id}/discover"
  end

  describe "discovery links that route to users/:user_id/movies" do 
    it "button to discover top rated movies" do 
      click_button "Discover Top Rated Movies"

      expect(current_path).to eq("/users/#{@user1.id}/movies")
    end

    it "a text field to search by title with search button" do 
      fill_in "keyword", with: "Jaws"
      click_button "Search"

      expect(current_path).to eq("/users/#{@user1.id}/movies")
    end
  end
end