require "rails_helper"

RSpec.describe "Login Page" do 
  before(:each) do 
    @user_1 = User.create!(name: "Joe Smith", email: "joey_smithy@yahooey.com", password: "hellokitty", password_confirmation: "hellokitty")
    visit "/login"
  end

  describe "On the login page" do 
    it "can input email and password and is redirected to the dashboard page" do 
      expect(page).to have_field(:email)
      expect(page).to have_field(:password)

      fill_in(:email, with: @user_1.email)
      fill_in(:password, with: @user_1.password)

      click_on "Log In"

      expect(current_path).to eq(user_path(@user_1))
    end

    it " will not let the user login with bad credentials" do 
      fill_in(:email, with: @user_1.email)
      fill_in(:password, with: "hahahahahahahah")

      click_on "Log In"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Sorry, your credentials are bad")
    end
  end
end