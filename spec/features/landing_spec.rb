require 'rails_helper'

RSpec.describe 'landing page' do
  describe 'root path landing page' do
    before :each do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @user3 = FactoryBot.create(:user)
      @user4 = FactoryBot.create(:user)

      visit "/"
    end

    
    it 'application title' do
      within "#title" do
        expect(page).to have_content("Movie Viewing Party!")
      end
    end
    
    it 'create new user button' do
      within "#title" do
        expect(page).to have_button "Create New User"
      end
    end
    
    it 'links of existing users' do
      within "#users" do
        expect(page).to have_link "#{@user1.name}"
        expect(page).to have_link "#{@user2.name}"

        click_link "#{@user1.name}"
        expect(current_path).to eq user_path(@user1.id)
      end
    end

    it 'link to return to landing page' do
      expect(page).to have_link "Return to Movie Viewing Party Landing Page"
      click_link "Return to Movie Viewing Party Landing Page"
      expect(current_path).to eq "/"
    end
  end
end