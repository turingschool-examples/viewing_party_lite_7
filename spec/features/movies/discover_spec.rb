require 'rails_helper'

RSpec.describe 'Users Discover Page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Sarah', email: 'Sarah@gmail.com')
    @user2 = User.create!(name: 'Jimmy', email: 'Jimmy@gmail.com')
  end
  describe 'As a user, when I visit the User Dashboard and I click on "Discover Movies"' do
    it 'redirects me to a discover movies page' do
      visit user_path(@user1)
      click_button 'Discover Movies'

      expect(current_path).to eq(discover_path(@user1))

      visit user_path(@user2)
      click_button 'Discover Movies'

      expect(current_path).to eq(discover_path(@user2))
    end
  end
end