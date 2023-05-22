require 'rails_helper'

RSpec.describe "Login Page" do
  describe "login page" do
    before :each do
      visit login_path
      @user = User.create!(name: "Angel Byun", email: "angelbyun@turing.edu", password: "test", password_confirmation: "test")
    end

    it "creates a login form" do
      expect(current_path).to eq(login_path)

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_on "Log In"

      expect(current_path).to eq(dashboard_path(@user))
    end
  end
end