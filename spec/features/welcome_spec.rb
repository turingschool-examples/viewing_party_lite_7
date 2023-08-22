require 'rails_helper'

describe 'Welcome page' do
  describe "When a user visits the root path they should be on the landing page ('/')" do
    it 'should display the title of the application' do
      visit '/'
      expect(page).to have_content('Viewing Party')
    end
    it 'should have a button to create a new user' do
      visit '/'
      expect(page).to have_button('Create a New User')
    end
    it 'should show a list of existing users which links to the users dashboard' do
      user_1 = create(:user)
      user_2 = create(:user)
      user_3 = create(:user)
      user_4 = create(:user)
      users = [user_1, user_2, user_3, user_4]
      visit '/'
      save_and_open_page
      within '#existing_users' do
        users.each do |user|
          expect(page).to have_content(user.email)
        end
      end
    end
    it 'should include a link to go back to the landing page' do
      visit '/'
      expect(page).to have_link('Home', href: '/')
    end
  end
end
