require "rails_helper"

# As a logged in user
# When I visit the landing page
# I no longer see a link to Log In or Create an Account
# But I see a link to Log Out.
# When I click the link to Log Out
# I'm taken to the landing page
# And I can see that the Log Out link has changed back to a Log In link

RSpec.describe "Logging Out" do
  describe "As a logged in user" do
    it "can log out" do
      user = User.create!(name: "Bob", email: "bob@gmail.com", password: "password")

      visit root_path
      click_link "Log In"
      expect(current_path).to eq(login_path)
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_button "Log In"
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      expect(page).to_not have_link("Log In")
      expect(page).to_not have_link("Register a New User")
      expect(page).to have_link("Log Out")

      click_link "Log Out"

      expect(current_path).to eq(root_path)

      expect(page).to have_link("Log In")
      expect(page).to have_link("Register a New User")
      expect(page).to_not have_link("Log Out")
    end
  end
end