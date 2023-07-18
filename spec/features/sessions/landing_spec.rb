require 'rails_helper'

RSpec.describe 'Application landing page' do
  describe 'landing page view' do
    before :each do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @user3 = FactoryBot.create(:user)
      @user4 = FactoryBot.create(:user)

      visit "/"
    end

    it "has title header with create user button" do
      within "#title" do
        expect(page).to have_content("Movie Viewing Party!")
        expect(page).to have_button "Create New User"
      end
    end

    it "has user list with links" do
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

    it "has link to login form" do
      within "#title" do
        expect(page).to have_link "Already have an account - Login"

        click_link "Already have an account - Login"
        expect(current_path).to eq login_path
      end
    end
  end
end