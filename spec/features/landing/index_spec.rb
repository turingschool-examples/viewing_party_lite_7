require 'rails_helper'

RSpec.describe 'landing page', type: :feature do
  before(:each) do
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)
    
    visit '/'
  end

  describe 'As a visitor' do
    it 'when I visit the root path I should see the title of the application' do
      expect(page).to have_content('Viewing Party')
    end
    
    it 'when I visit the root path I should see a button to create a new user' do
      within('#new-user') do
        expect(page).to have_link('Create User')
        
        click_link('Create User')
        
        expect(current_path).to eq(register_path)
      end
    end

    it 'has a link to log in that routes to /login' do
      expect(page).to have_link('Log In')
      
      click_link('Log In')
      
      expect(current_path).to eq(login_path)
    end
      
    it 'I do not see a list of existing user' do
      expect(page).to_not have_content('Existing Users')
      expect(page).to_not have_content(@user_1.email)
      expect(page).to_not have_content(@user_2.email)
      expect(page).to_not have_content(@user_3.email)
    end

    it 'when I visit the root path I should see a link to go back to the landing page' do
      expect(page).to have_link('Home')

      click_link('Home')

      expect(current_path).to eq(root_path)
    end
  end

  describe 'As a logged in user' do
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit '/'
    end
    
    it 'when I visit the root path as a logged in user I should see a list of existing users' do
      within('#existing-users') do
        expect(page).to have_content('Existing Users')
        
        expect(page).to have_content(@user_1.email)
        expect(page).to have_content(@user_2.email)
        expect(page).to have_content(@user_3.email)
      end
    end

    it 'when I visit the root path I should see a link to go back to the landing page' do
      expect(page).to have_link('Home')

      click_link('Home')

      expect(current_path).to eq(root_path)
    end
  
    it 'has a link to log out' do
      expect(page).to have_link('Log Out')
    end
  end
end