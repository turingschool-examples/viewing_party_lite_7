require "rails_helper"

RSpec.describe "Landing", type: :feature do
  before(:each) do
    @user_1 = create(:user, password: "test123", password_confirmation: "test123")
    @user_2 = create(:user, password: "test123", password_confirmation: "test123")
    @user_3 = create(:user, password: "test123", password_confirmation: "test123")

    visit root_path
  end

  describe "User Story 3 - Authentication" do
    it "has a login link that takes me to the login page" do
      
      expect(page).to have_link("Log In")
      click_link "Log In"
      
      expect(current_path).to eq(login_path)

      fill_in :email, with: @user_1.email
      fill_in :password, with: @user_1.password
      click_button "Log In"

      expect(current_path).to eq(user_path(@user_1.id))
    end
    
    # User Story 4 - Authentication
    it "will not log in a user with incorrect credentials" do
      click_link "Log In"
      fill_in :email, with: @user_1.email
      fill_in :password, with: "wrong_password"
      
      click_button "Log In"
      
      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid Credentials")
    end
  end
end