# When I visit '/users/:id' where :id is a valid user id,
# I should see:

# "<user's name>'s Dashboard" at the top of the page
# A button to Discover Movies*
# A section that lists viewing parties**
# *more instructions on this in the Dashboard:Discover Movies issue.
# **more instructions on this in the Dashboard:Viewing Parties issue.

require 'rails_helper'

RSpec.describe 'Users Dashboard' do
  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:user_3) { create(:user) }
  
  let!(:vp_1) { create(:viewing_party, user_id: user_1.id, movie: 1864) }
  let!(:vp_2) { create(:viewing_party, user_id: user_1.id, movie: 1999) }
  let!(:vp_3) { create(:viewing_party, user_id: user_1.id, movie: 1985) }


  describe 'Displays page content' do
    it 'should display the name of the dashboard and list of viewing parties' do
      visit user_path(user_1)

      expect(page).to have_content("#{user_1.name}'s Dashboard")
      expect(page).to have_button("Discover Movies")
      # expect(page).to have_content("Hello-Goodbye")
      # expect(page).to have_content("In the Bedroom")
      # expect(page).to have_content("The Constant Gardener")
    end
  end
end