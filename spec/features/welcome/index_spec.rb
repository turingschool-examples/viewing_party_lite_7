require 'rails_helper'

RSpec.describe 'landing page, welcome index', type: :feature do
  describe 'When a user visits the root path "/"' do
    before(:each) do
      @user_1 = User.create!(name: 'Sam', email: 'sam_t@email.com')
      @user_2 = User.create!(name: 'Tommy', email: 'tommy123@email.com')

      visit landing_path
    end

    it 'They see title of application' do
      expect(page).to have_content('Viewing Party')
    end

    it 'They see button to create a New User' do
      expect(page).to have_selector(:link_or_button, 'Create New User')
    end

    it 'They see list of existing Users, which links to users dashboard, each dashboard has link back to landing page' do
      expect(page).to have_content('Existing Users')
      expect(page).to have_link('sam_t@email.com')
      expect(page).to have_link('tommy123@email.com')
    end
  end

end
