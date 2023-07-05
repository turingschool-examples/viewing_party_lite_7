require "rails_helper"

RSpec.describe "user registration page", type: :feature do
  before(:each) do
    @user3 = User.create!(name: "boston", email: "boston@example.com")
    visit "/register"
  end

  describe "when I visit the user registration page" do
    it 'I see a link to return to the landing page' do
      expect(page).to have_link("Home")
      click_link "Home"
      expect(current_path).to eq("/")
    end

    it "I see a for to register a user" do
      expect(page).to have_content("New User Registration")
      within("#user-registration") do
        expect(page).to have_content("Name")
        expect(page).to have_content("Email")
        expect(page).to have_button("Register User")
      end
    end
  end
end