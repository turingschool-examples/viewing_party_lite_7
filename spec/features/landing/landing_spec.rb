require 'rails_helper'

RSpec.describe 'Landing', type: :feature do
  before(:each) do
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)

    visit root_path
  end

  describe "User Story 4" do
    it 'shows the landing page with the name of the app and a button to create a new user' do
      expect(page).to have_content('Viewing Party')
      expect(page).to have_button('Create New User')
    end

    it 'shows the existing users as a link to their dashboard' do
      within("#user_#{user_1.id}") { expect(page).to have_link("#{user_1.name} - #{user_1.email}"), href: dashboard_path(user_1.id) }
      within("#user_#{user_2.id}") { expect(page).to have_link("#{user_2.name} - #{user_2.email}"), href: dashboard_path(user_2.id) }
      within("#user_#{user_3.id}") { expect(page).to have_link("#{user_3.name} - #{user_3.email}"), href: dashboard_path(user_3.id) }
      end
    end

    it 'has a link to the landing page' do
      expect(page).to have_link('Home'), href: root_path
    end
  end
end