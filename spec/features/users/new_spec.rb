require 'rails_helper'

RSpec.describe 'User Registration' do
  describe "When I visit the user registration page" do
    it "can create a new user" do
      visit register_path

      fill_in :name, with: "Bob"
      fill_in :email, with: "bob@bob.com"

      click_button "Register"

      user = User.last
      expect(current_path).to eq(dashboard_path(user.id))
    end
  end
end