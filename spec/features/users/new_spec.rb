require 'rails_helper'

RSpec.describe 'New User Form', type: :feature do
  before(:each) do
    visit '/register'
  end
  describe 'create a new user' do
    it 'using valid data' do
      fill_in 'Name', with: 'Wolfie'
      fill_in 'Email', with: 'wolfie@gmail.com'
      click_button 'Create User'
      new_user = User.all.last
      expect(current_path).to eq("/users/#{User.all.last.id}")
      expect(page).to have_content("#{new_user.name}'s Dashboard")
      expect(page).to have_content("#{new_user.email}")
      expect(page).to have_content('User successfully registered.')
    end

    it 'using invalid name data' do
      fill_in 'Name', with: ''
      fill_in 'Email', with: 'wolfie@gmail.com'
      click_button 'Create User'

      expect(current_path).to eq('/register')
      expect(page).to have_content("Error: Name can't be blank")
    end

    it 'using invalid email data' do
      fill_in 'Name', with: 'Wolfie'
      fill_in 'Email', with: ''
      click_button 'Create User'

      expect(current_path).to eq('/register')
      expect(page).to have_content("Error: Email can't be blank")
    end
  end
end
