require 'rails_helper'

RSpec.describe "Landing page", type: :feature do

  before(:each) do
    @user1 = User.create!(name: "Bob", email: "bob@bob.com")
    @user2 = User.create!(name: "John", email: "john@john.com")
    @user3 = User.create!(name: "Jack", email: "Jack@jack.com")
    visit '/'
  end

  describe "When I visit the Landing page" do
    it "I see the title of the application" do
      expect(page).to have_link("Home")
      expect(page).to have_content("Viewing Party")
      expect(page).to have_button("Register")

      within("#current-users") do
        expect(page).to have_content("Current Users")
        expect(page).to have_link(@user1.name)
        expect(page).to have_link(@user2.name)
        expect(page).to have_link(@user3.name)
      end
    end
  end
end