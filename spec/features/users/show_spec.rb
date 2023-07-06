require "rails_helper"

RSpec.describe "User Show Page" do
  describe "User Dashboard" do
    before :each do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @user3 = FactoryBot.create(:user)
      @user4 = FactoryBot.create(:user)

      visit user_path(@user1.id)
    end

    it "dashboard title" do
      expect(page).to have_content("#{@user1.name}'s Dashboard")
    end

    it "discover movies button" do
      expect(page).to have_button "Discover Movies"
    end

    it "viewing party list" do
      within "#parties" do
        expect(page).to have_content("Available Viewing Parties")
      end
    end

    it "Discover Movies directes to 'user' discover page"do
      click_button "Discover Movies"
      expect(current_path).to eq(user_discover_index_path(@user1.id))
      save_and_open_page
    end
  end
end