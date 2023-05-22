require 'rails_helper'

RSpec.describe "Login Page" do
  describe "login page" do
    before :each do
      visit login_path
      @user = User.create!(name: "Angel Byun", email: "angelbyun@turing.edu", password: "test", password_confirmation: "test")
    end

    it "creates an invalid credentials error when form is not filled in with right information" do
      expect(current_path).to eq(login_path)

      fill_in :email, with: @user.email
      fill_in :password, with: "12345"

      click_on "Log In"

      expect(page).to have_content("Invalid Credentials")
      expect(current_path).to eq(login_path)
    end
  end
end