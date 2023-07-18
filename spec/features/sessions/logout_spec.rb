require 'rails_helper'

RSpec.describe "User Logout Path" do
  describe "User logout button" do
    before :each do
      @user = User.create!(email: "email@email.com", name: "Email", password: "secretpassword")
    end

    it "can logout user" do
      visit login_path
      fill_in :email, with: "#{@user.email}"
      fill_in :password, with: "#{@user.password}"
      click_button "Login"
      expect(current_path).to eq(user_path(@user.id))

      click_link "Return to Movie Viewing Party Landing Page"
      expect(current_path).to eq(root_path)

      expect(page).to have_button "Logout"
      expect(page).to_not have_link "Already have an account - Login"
      click_button "Logout"
      
      expect(current_path).to eq(root_path)
      expect(page).to have_link "Already have an account - Login"
      expect(page).to_not have_button "Logout"
    end
  end
end