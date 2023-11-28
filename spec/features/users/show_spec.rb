require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  describe 'when a user visits the users dashboard' do
    before(:each) do
      @user = create(:user)
    end
    
    it 'displays the users name and Dashboard on the top of the page' do
      visit user_path(@user)

      expect(page).to have_content("#{@user.name}'s Dashboard")
    end

    it 'displays a button to discover movies which redirects the user to the users discover page' do
      visit user_path(@user.id)

      expect(page).to have_button("Discover Movies")

      click_on("Discover Movies")

      expect(current_path).to eq(user_discover_index_path(@user))
    end
  end
end
