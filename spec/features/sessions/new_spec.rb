require "rails_helper"

RSpec.describe "login form" do
  describe "as a registered user" do
    describe "when I visit the login form" do
      describe "happy path" do
        let!(:user_1) { create(:user) }

        # As a registered user
        # When I'm taken to a Log In page ('/login')
        # I can input my unique email and password
        # When I enter my unique email and correct password
        # I'm taken to my dashboard page
        it "displays a form for a registered user to log in" do
          visit login_path
          expect(page).to have_content("Registered Users")
          expect(page).to have_content("Email")
          expect(page).to have_content("Password")

          expect(page).to have_field(:email)
          expect(page).to have_field(:password)
          expect(page).to have_button("Submit")
        end

        it "user can log in with valid credentials" do
          visit login_path
          fill_in :email, with: user_1.email
          fill_in :password, with: "test"
          click_button "Submit"

          expect(current_path).to eq(user_path(user_1))
          expect(page).to have_content("Welcome back, #{user_1.name}!")
        end
      end

      describe "sad path" do
        xit "will not log a user in with invalid credentials" do
          visit login_path
          fill_in :password, with: "not_test"
          expect(current_path).to eq(login_path)
          expect(page).to have_content("Invalid credentials")
        end
      end
    end
  end
end