require "rails_helper"
RSpec.describe "/register" do
  describe "As a user" do
    describe "when I visit the registration page" do
      it "displays a form to register a new user" do
        visit register_user_path
        expect(page).to have_field(:name)
        expect(page).to have_field(:email)
        expect(page).to have_field(:password)
        expect(page).to have_field(:password_confirmation)

        expect(page).to have_content("New User Registration Form")
        expect(page).to have_content("Name")
        expect(page).to have_content("Email")
        expect(page).to have_content("Password")
        expect(page).to have_content("Password Confirmation")
        expect(page).to have_button("Submit")
      end

      describe "happy path" do
        it "can create a new user" do
          visit register_user_path
          fill_in(:name, with: "Joey")
          fill_in(:email, with: "Joey@joeyjoey.com")
          fill_in(:password, with: "test")
          fill_in(:password_confirmation, with: "test")
          click_button "Submit"

          user = User.find_by(email: "Joey@joeyjoey.com")
          expect(current_path).to eq(user_path(user.id))
          expect(page).to have_content("Joey")
          expect(page).to have_content("Joey@joeyjoey.com")
        end

        it "expects valid form" do
          visit register_user_path
          fill_in(:name, with: "Bill")
          click_button "Submit"
          expect(current_path).to eq(register_user_path)
        end
      end

      describe "sad path" do
        # As a visitor
        # When I visit `/register`
        # and I fail to fill in my name, unique email, OR matching passwords,
        # I'm taken back to the `/register` page
        # and a flash message pops up, telling me what went wrong
        xit "will not create a user without acceptable parameters" do
          visit register_user_path
          fill_in(:name, with: "")
          fill_in(:email, with: "Bill's Email address")
          fill_in(:password, with: "not_test")
          fill_in(:password_confirmation, with: "still_not_test")

          expect(current_path).to eq(register_user_path)
          expect(page).to have_content("Invalid credentials, please fill out form")
        end
      end
    end
  end
end
