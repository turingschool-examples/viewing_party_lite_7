require 'rails_helper'

RSpec.describe 'Logging Out' do
  describe 'As a registered user' do
    it 'Can log out and be redirected to the login page' do
      user = User.create!(name: 'Jimmy', email: 'movie_buff333@gmail.com', password: 'movies123', password_confirmation: 'movies123')
      
      visit login_path
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_button 'Log In'

      visit root_path

      expect(page).to_not have_button('Log In')
      expect(page).to have_button('Log Out')

      click_button 'Log Out'

      expect(current_path).to eq(root_path)
      expect(page).to have_button('Log In')
      expect(page).to_not have_button('Log Out')
    end
  end
end