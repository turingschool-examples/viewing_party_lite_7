require "rails_helper"

RSpec.describe "Discover Movies", type: :feature do
  before(:each) do
    @user = create :user
  end

  describe "redirect action from user dashboard" do
    it "routes from user dashboard to the discover movies page" do
      visit user_path(@user)

      click_button "Discover Movies"

      expect(page).to have_current_path discover_user_path(@user)
    end
  end
end
