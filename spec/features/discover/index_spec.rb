require 'rails_helper'

RSpec.describe "Discover Index page", type: :feature do
  describe "When I visit the discover index page" do
    before(:each) do
      @user_1 = User.create!(name: "Kiwi", email: "kiwibird@gmail.com")

      visit "/users/#{@user_1.id}/discover"
    end

    it "the page exists" do
      expect(page).to have_current_path("/users/#{@user_1.id}/discover")
    end
  end
end