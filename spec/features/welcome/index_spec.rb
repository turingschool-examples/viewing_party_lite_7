require "rails_helper"

RSpec.describe "landing page", type: :feature do
  before(:each) do
    @user1 = User.create!(name: "John", email: "john@example.com")
    @user2 = User.create!(name: "myles", email: "myles@example.com")
    @user3 = User.create!(name: "boston", email: "boston@example.com")
    visit "/"
  end

  describe "when I visit the landing page" do
    it "I see the title of the application, a button to register, a list of current users, and a link to the home page" do
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