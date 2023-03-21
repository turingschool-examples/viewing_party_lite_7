require 'rails_helper'

RSpec.describe 'Landing', type: :feature do
  before(:each) do
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)
  end

  describe "User Story 4" do
    it 'shows the landing page with the name of the app and a button to create a new user' do
      visit root_path
      expect(page).to have_content('Viewing Party')
      expect(page).to have_button('Create New User')
    end

    it 'shows the existing users as a link to their dashboard' do
      within '#existing_users' do
        expect(page).to have_content("#{user_1.name} - #{user_1.email}")
        expect(page).to have_content("#{user_2.name} - #{user_2.email}")
        expect(page).to have_content("#{user_3.name} - #{user_3.email}")
      end
    end
  end
end