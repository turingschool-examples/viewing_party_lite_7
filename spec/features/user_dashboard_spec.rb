require 'rails_helper'

describe 'User Dashboard' do
  describe "When I visit '/users/:id' where :id is a valid user id" do
    it "I should see: '<user's name>'s Dashboard' at the top of the page, A button to Discover Movies, A section that lists viewing parties" do
      user = create(:user)
      visit "/users/#{user.id}"

      expect(page).to have_content("#{user.name}'s Dashboard")
      expect(page).to have_button "Discover Movies"
      expect(page).to have_css("#viewing_parties")
      save_and_open_page
    end
  end
end