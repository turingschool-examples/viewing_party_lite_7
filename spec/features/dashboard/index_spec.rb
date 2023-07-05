# When a user visits the root path they should be on the landing page ('/') which includes:
# Title of Application
# Button to Create a New User
# List of Existing Users which links to the users dashboard
# Link to go back to the landing page (this link will be present at the top of all pages)

require 'rails_helper'

RSpec.describe 'Landing Page' do
  before(:each) do
    visit root_path
  end

  it 'displays the title of the application' do

  end

  xit 'displays a button to create a new user' do

  end

  xit 'displays a list of existing users which links to the users dashboard' do

  end

  xit 'displays a link to go back to the landing page' do

  end
end
