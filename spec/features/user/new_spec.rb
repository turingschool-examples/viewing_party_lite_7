require "rails_helper"

RSpec.describe "User Registration Page" do
  before do
    visit "/register"
  end

  describe "form" do
    it "has a form with fields for name and email" do
      expect(page).to have_field("name")
      expect(page).to have_field("email")
    end

    it "has a register button" do
      expect(page).to have_button("Register")
    end
  end

  describe "form submission" do
    describe "happy path" do
      it "redirects to the newly created user's dashboard" do
        fill_in "Name", with: "Anna Wiley"
        fill_in "Email", with: "awiley33@gmail.com"
        click_button "Register"

        @anna = User.last
        expect(current_path).to eq(user_path(@anna))
      end
    end

    describe "sad path" do
      before :each do
        fill_in "Name", with: "Anna Wiley"
        fill_in "Email", with: "awiley33@gmail.com"
        click_button "Register"

        visit "/register"

        fill_in "Name", with: "Amy Wiley"
        fill_in "Email", with: "awiley33@gmail.com"
        click_button "Register"
      end
      
      it "displays a flash notice" do
        expect(page).to have_content("An account already exists with this email address.")
      end
      
      it "renders the registration form again" do
        expect(page).to have_field("Name")
        expect(page).to have_field("Email")
        expect(page).to have_button("Register")
      end
    end
  end
end