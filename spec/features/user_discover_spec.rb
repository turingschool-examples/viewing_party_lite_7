require 'rails_helper'

describe 'User Discover page' do
  describe "When I visit the '/users/:id/discover' path, where :id, is the id of a valid user," do
    it "I should see a Button to 'Discover Top Rated Movies', A text field to enter keyword(s) to search by movie title, and A Button to 'Search by Movie Title'" do
      user = create(:user)
      visit "/users/#{user.id}/discover"

      expect(page).to have_button("Discover Top Rated Movies")
      expect(page).to have_css("#keyword_search")
      expect(page).to have_button("Search by Movie Title")
    end
  end
end