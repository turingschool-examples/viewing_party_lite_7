require 'rails_helper'

RSpec.describe '/', type: :feature do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
  end

  describe 'When a user visits the root path' do
    it "should be on the landing page ('/') and I see the title of the applications" do
      visit root_path
      expect(page).to have_content('Viewing Party')
    end

    it 'I see a button to create a new user' do
      visit root_path
      expect(page).to have_button('Create a New User')
    end

    it 'I see a list of existing users which links to the their dashboard' do
      visit new_session_path

      fill_in :email, with: @user1.email
      fill_in :password, with: @user1.password
      click_button 'Log In'

      visit root_path

      expect(page).to have_content('Existing Users')

      within "#user_#{@user1.id}" do
        expect(page).to have_content(@user1.email)
      end
      within "#user_#{@user2.id}" do
        expect(page).to have_content(@user2.email)
      end
      within "#user_#{@user3.id}" do
        expect(page).to have_content(@user3.email)
      end
    end

    it 'I see a link (Home) that will take me back to the welcome page' do
      visit root_path
      expect(page).to have_link('Home')

      click_link('Home')

      expect(current_path).to eq(root_path)
    end
  end

  describe 'When a visitor visits the root path' do
    describe 'As visitor when I visit the landing page' do
      it 'I do not see the section of the page that lists existing users' do
        visit root_path

        expect(page).to_not have_content(@user1.email)
        expect(page).to_not have_content(@user2.email)
        expect(page).to_not have_content(@user3.email)
      end
    end
  end
end