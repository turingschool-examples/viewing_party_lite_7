require "rails_helper"

RSpec.describe "New User Registration Page" do
  before(:each) do
    visit "/register"
  end

  context "When a user visits the '/register' path" do 
    it "I see a form to create a new user, once created I am take back to that user's dashboard" do
      fill_in "Name", with: "Pete"
      fill_in "Email", with: "pete@email.com"

      click_on "Create User"
      save_and_open_page
      expect(current_path).to eq(user_path(User.last))
    end
  end
end