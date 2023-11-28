require "rails_helper"

RSpec.describe "Register Page", type: :feature do
  # US 2
  describe "when a user visits the '/register' path they should see a form to register" do
    describe "Successful Path to Register" do
      it "displays a form to register" do
        visit register_path

        expect(page).to have_content("Register New User")

        fill_in "Name", with: "Kyo"
        fill_in "Email", with: "kyo@gmail.com"

        click_on "Register"

        expect(current_path).to eq(user_path(User.all.last))
        expect(page).to have_content("User created successfully")
        expect(page).to have_content("#{User.all.last.name}'s Dashboard")
        expect(page).to have_content("Email: #{User.all.last.email}")
      end
    end

    describe "Unsuccessful Path to Register" do
      it "displays a form to register with name & email blank" do
        visit register_path

        expect(page).to have_content("Register New User")

        fill_in "Name", with: ""
        fill_in "Email", with: "kyo@gmail.com"
        click_on "Register"

        expect(page).to have_content("Name can't be blank")

        fill_in "Name", with: "Kyo"
        fill_in "Email", with: ""
        click_on "Register"

        expect(page).to have_content("Email can't be blank")
      end

      it "can't create a duplicate user email" do
        visit register_path

        expect(page).to have_content("Register New User")

        fill_in "Name", with: "Kyo"
        fill_in "Email", with: "kyo@gmail.com"

        click_on "Register"

        expect(current_path).to eq(user_path(User.all.last))
        expect(page).to have_content("User created successfully")
        expect(page).to have_content("#{User.all.last.name}'s Dashboard")
        expect(page).to have_content("Email: #{User.all.last.email}")

        visit register_path

        fill_in "Name", with: "Kyo"
        fill_in "Email", with: "kyo@gmail.com"
        click_on "Register"

        expect(page).to have_content("Email has already been taken")
      end
    end
  end
end
