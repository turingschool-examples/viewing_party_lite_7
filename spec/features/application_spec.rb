# When a user visits the root path they should be on the landing page ('/') which includes:

#  Title of Application
#  Button to Create a New User
#  List of Existing Users which links to the users dashboard
#  Link to go back to the landing page (this link will be present at the top of all pages)

require 'rails_helper'

RSpec.describe "landing page" do
  describe "as a user, when I visit the landing page" do
    before(:each) do
      visit root_path
      @user_1 = User.create!(name: "Katie", email: "email_address@gmail.com")
      @user_2 = User.create!(name: "Steve", email: "email_address_2@gmail.com")
      @user_3 = User.create!(name: "Stacey", email: "email_address_3@gmail.com")
      @users = [@user_1, @user_2, @user_3]
    end
    it "displays the title of the application" do
      within("#title") do
        expect(page).to have_content("Viewing Party")
      end
    end
    it "has a button to create a new user" do
      within("#new-user") do
        expect(page).to have_button("Create New User")
        # click_button("Create New User")
      end

      # expect(current_path).to eq("/register")
    end
    it "has a list of existing users which links to the user dashboard" do
      within("#users") do
        @users.each do |user|
          expect(page).to have_link("#{user.email}")
          click_link("#{user.email}")
          expect(current_path).to eq(user_path(user.id))
          visit root_path
        end
      end

    end
    xit "has a link to go back to the landing page" do

    end
  end
end