require 'rails_helper'

RSpec.describe 'destroy session - logout page', type: :feature do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
  end

  describe 'Log out a user' do
    describe 'As a logged-in user when I visit the landing page' do
      it 'I no longer see a link to log in or create an account, but see a link to log out' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit root_path

        expect(page).to have_content('Log Out')
        expect(page).to_not have_content('Log In')
        expect(page).to_not have_content('Create a New User')
      end

      it 'When I click the link to log out I am taken to the landing page and can see the log out link is changed to log in link' do
        visit new_session_path

        fill_in :email, with: @user1.email
        fill_in :password, with: @user1.password
        click_button 'Log In'

        visit root_path

        click_on 'Log Out'

        expect(current_path).to eq(root_path)
        expect(page).to_not have_content('Log Out')
        expect(page).to have_content('Log In')
        expect(page).to have_content('Create a New User')
      end
    end
  end
end
