require "rails_helper"

RSpec.describe User, type: :feature do
  before :each do
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)
  end

  describe "User Dashboard Page" do
    # US 3
    it "displays a specific user dashboard attributes" do
      visit user_path(@user_1)

      expect(page).to have_content("#{@user_1.name}'s Dashboard")
      expect(page).to have_content("Email: #{@user_1.email}")
      expect(page).to have_button("Discover Movies")
    end
  end
end