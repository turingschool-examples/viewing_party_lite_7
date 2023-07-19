require "rails_helper"

RSpec.describe "/", type: :feature do
  before(:each) do
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)
    visit root_path
  end

  describe "When a user visits the root path" do
    it "should be on the landing page ('/') and I see the title of the applications" do
      expect(page).to have_content("Viewing Party")
    end

    it "I see a button to create a new user" do
      expect(page).to have_link("Register a New User")

      click_link "Register a New User"

      expect(current_path).to eq(new_user_path)
    end

    it "I see a link (Home) that will take me back to the welcome page" do
      expect(page).to have_link("Home")

      click_link("Home")

      expect(current_path).to eq(root_path)
    end

    it "existing users aren't links" do
      user = User.create!(name: "Bob", email: "bob@gmail.com", password: "password")
      user1 = User.create!(name: "Javen", email: "javen@gmail.com", password: "password")

      click_link "Log In"
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_button "Log In"
      click_link "Home"

      expect(page).to have_content("Existing Users")
      expect(page).to have_content(user.email)
      expect(page).to have_content(user1.email)

      expect(page).to_not have_link(user.email)
      expect(page).to_not have_link(user1.email)
    end
  end
end
