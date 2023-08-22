require 'rails_helper'

describe 'User Dashboard' do
  describe "When I visit '/users/:id' where :id is a valid user id" do
    it "I should see: '<user's name>'s Dashboard' at the top of the page, A button to Discover Movies, A section that lists viewing parties" do
      user = create(:user)
      visit "/users/#{user.id}"
      
      expect(page).to have_content("#{user.name}'s Dashboard")
      expect(page).to have_button "Discover Movies"
      expect(page).to have_css("#viewing_parties")
    end
    
    it "and click 'Discover Movies' button, I am redirected to a discover page '/users/:id/discover', where :id is the user id of the user who's dashboard I was just on." do
      user = create(:user)
      visit "/users/#{user.id}"
      click_button "Discover Movies"

      expect(current_path).to eq("/users/#{user.id}/discover")
    end
  end
end