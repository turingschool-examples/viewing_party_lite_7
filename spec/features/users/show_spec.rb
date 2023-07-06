require "rails_helper"

RSpec.describe "user_path(user)", type: :feature do
  describe "on a user dashboard" do
    let(:user) { create(:user) }
    let(:user2) { create(:user) }

    it "should render only the user's name" do
      visit user_path(user)

      expect(page).to have_content("#{user.name}'s Dashboard")
      expect(page).to_not have_content("#{user2.name}'s Dashboard")
    end

    it "routes me to the discover movies dashboard" do
      visit user_path(user)
      click_button "Discover Movies"
      expect(current_path).to eq(user_discover_index_path(user))
    end
  end
end
