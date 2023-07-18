require "rails_helper"

RSpec.describe "Creates a new User" do
  describe "visit /register" do
    it "has a form to register a new user" do
      visit "/register"

      expect(page).to have_field(:user_name)
      expect(page).to have_field(:user_email)
      expect(page).to have_field(:user_password)
      expect(page).to have_field(:user_password_confirmation)
      expect(page).to have_button("Create User")
    end

    it "can register a new user" do
      visit root_path

      click_on "Register a New User"

      expect(current_path).to eq(new_user_path)

      name = "Bob"
      email = "bob@gmail.com"
      password = "password"

      fill_in :user_name, with: name
      fill_in :user_email, with: email
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      click_button "Create User"
# save_and_open_page
      expect(page).to have_content("#{name}'s Dashboard")
    end

    it "gives an error if all fields aren't filled out" do
      visit "/register"

      name = "Bob"
      email = "bob@gmail.com"
      password = "password"

      # fill_in :user_name, with: name
      fill_in :user_email, with: email
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      click_button "Create User"

      expect(current_path).to eq("/register")
      expect(page).to have_content("Sorry, your credentials are bad.")
    end

    it "gives an error if email is not unique" do
      @user_1 = User.create!(name: "Cody", email: "javenb22@gmail.com", password: "password")
      visit "/register"

      fill_in :user_name, with: "Javen"
      fill_in :user_email, with: "javenb22@gmail.com"
      fill_in :user_password, with: "password"
      fill_in :user_password_confirmation, with: "password"
      click_button "Create User"

      expect(current_path).to eq("/register")
      expect(page).to have_content("Sorry, your credentials are bad.")
    end

    it "gives an error if passwords don't match" do
      user = User.create!(name: "Cody", email: "cody@gmail.com", password: "password")

      visit "/register"

      fill_in :user_name, with: user.name
      fill_in :user_email, with: user.email
      fill_in :user_password, with: "password1"
      fill_in :user_password_confirmation, with: user.password

      click_button "Create User"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Password and Password Confirmation does not match.")
    end
  end
end
