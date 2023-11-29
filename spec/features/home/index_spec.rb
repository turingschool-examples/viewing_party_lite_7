require 'rails_helper'

RSpec.describe 'Home', type: :feature do
  before(:each) do
    load_test_data
  end
  describe 'GET /' do
    it 'displays the title of the application' do
      visit '/'
      expect(page).to have_content('Viewing Party Lite')
    end

    it 'displays a button to create a new user' do
      visit '/'
      expect(page).to have_button('Create New User')
    end

    it 'displays a list of existing users with links to their dashboards' do
      visit '/'
      expect(page).to have_link(@user1.name, href: user_path(@user1))
      expect(page).to have_link(@user2.name, href: user_path(@user2))
    end

    it 'displays a link to go back to the landing page' do
      visit '/'
      expect(page).to have_link('Go back to Landing Page', href: root_path)
    end
  end
end
