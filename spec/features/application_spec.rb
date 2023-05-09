# When a user visits the root path they should be on the landing page ('/') which includes:

#  Title of Application
#  Button to Create a New User
#  List of Existing Users which links to the users dashboard
#  Link to go back to the landing page (this link will be present at the top of all pages)

require 'rails_helper'

RSpec.describe 'landing page' do
  describe 'as a user, when I visit the landing page' do
    it 'displays the title of the application' do
      visit '/'
      within("#title") do
        expect(page).to have_content("Viewing Party")
      end
    end
    xit 'has a button to create a new user' do

    end
    xit 'has a list of existing users which links to the user dashboard' do

    end
    xit 'has a link to go back to the landing page' do

    end
  end
end