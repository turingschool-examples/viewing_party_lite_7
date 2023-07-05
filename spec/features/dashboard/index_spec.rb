# When a user visits the root path they should be on the landing page ('/') which includes:
# Title of Application
# Button to Create a New User
# List of Existing Users which links to the users dashboard
# Link to go back to the landing page (this link will be present at the top of all pages)

require 'rails_helper'

RSpec.describe 'Landing Page' do
  before(:each) do
    @user_1 = User.create!(name: 'John Smith', email: 'jsmith@aol.com')
    @user_2 = User.create!(name: 'Jane Doe', email: 'jdoe@gmail.com')
    @user_3 = User.create!(name: 'Michael Jackson', email: 'mjack@gmail.com')

    visit root_path
  end

  it 'displays the title of the application' do
    within('#title') do
      expect(page).to have_content('Viewing Party')
    end
  end

  xit 'displays a button to create a new user' do
    within('#create-user') do
      expect(page).to have_button('Create User')
    end
  end

  xit 'displays a list of existing users which links to the users dashboard' do
    within('#existing-users') do
      expect(page).to have_content('Existing Users')
      expect(page).to have_link(@user_1.name)
      expect(page).to have_link(@user_2.name)
      expect(page).to have_link(@user_3.name)
    end
  end

  xit 'displays a link to go back to the landing page' do
    expect(page).to have_link('Home')
    
    click_link('Home')
    expect(current_path).to eq(root_path)
  end
end
