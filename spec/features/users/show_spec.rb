require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  describe 'when a user visits the users dashboard' do
    it 'displays the users name and Dashboard on the top of the page' do
      @user = create(:user)

      visit user_path(@user)

      expect(page).to have_content("#{@user.name}'s Dashboard")
    end
  end
end
