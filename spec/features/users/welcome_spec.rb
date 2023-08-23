require 'rails_helper'

RSpec.describe 'User welcome' do
  before :each do
    @user_1 = User.create!(name: "User1", email: "email1@example.com")
    @user_2 = User.create!(name: "User2", email: "email2@example.com")
    @user_3 = User.create!(name: "User3", email: "email3@example.com")
  end

  describe 'happy path' do
    it 'has a landing page' do
      visit root_path
      
      expect(page).to have_content("Viewing Party")
      expect(page).to have_content(@user_1.name)
      expect(page).to have_content(@user_2.name)
      expect(page).to have_content(@user_3.name)
      expect(page).to have_link("Home")

      click_on 'New User'
      expect(current_path).to eq(new_user_path)
      click_on 'Home'
      expect(current_path).to eq(root_path)

      click_on @user_2.name
      expect(current_path).to eq(user_path(@user_2))
      click_on 'Home'
      expect(current_path).to eq(root_path)
    end
  end
end