require 'rails_helper'

RSpec.describe 'Visit Landing Page', type: :feature do
  user1 = create(:user)
  user2 = create(:user)
  user3 = create(:user)

  before do
    visit '/'
  end
  describe 'user can register' do

    it 'includes title of application' do
      expect(page).to have_content('Viewing Party')
    end
    
    it 'includes button to create a new user' do
      expect(page).to have_button('Create New User')
      click_button 'Create New User'
      expect(current_path).to eq(register_path)
    end
    
    it 'does not include a list of existing users which link to their dashboard' do
      expect(page).to_not have_content('Existing Users')
      expect(page).to_not have_content(user1.email)
      expect(page).to_not have_content(user2.email)
      expect(page).to_not have_content(user3.email)
    end
    
    it 'includes a link to go back to the landing page(present on all pages)' do
      expect(page).to have_link('Home')
    end
    
    it 'includes a link to log in' do 
      expect(page).to have_link('Log In')
      click_link 'Log In'
      expect(current_path).to eq(login_path)
    end
  end

  describe 'user can logout' do
    before do
      click_on 'Log In'
      fill_in 'Email', with: user1.email
      fill_in 'Password', with: user1.password
      click_button 'Log In'
      click_on 'Home'
    end

    it 'includes a link to log out' do

      expect(current_path).to eq(root_path)
      expect(page).to have_button('Log Out')
      expect(page).to_not have_link('Log In')
      expect(page).to_not have_button('Create New User')
    end

    it 'when I click on log out, I am redirected to the landing page' do
      click_on 'Log Out'

      expect(current_path).to eq(root_path)
      expect(page).to have_link('Log In')
      expect(page).to have_button('Create New User')
    end

    it 'if I am a registered user that is logged in, it shows all registered users' do
      expect(page).to have_content('Existing Users')
      expect(page).to have_content(user1.email)
      expect(page).to have_content(user2.email)
      expect(page).to have_content(user3.email)
    end
  end
  
  describe 'As a visitor' do
    it 'I cannot visit a user show page' do
      visit dashboard_path 

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Please log in to view this page')
      expect(page).to have_link('Log In')
      expect(page).to have_button('Create New User')
    end
  end
end
