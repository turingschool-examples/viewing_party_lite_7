require "rails_helper"

RSpec.describe "Landing Page" do 
  before(:each) do 
    @user_1 = User.create!(name: "Joe Smith", email: "joey_smithy@yahooey.com", password: "hellokitty", password_confirmation: "hellokitty")
    @user_2 = User.create!(name: "Sam Smith", email: "sam_smithy@yahooey.com", password: "hellokitty", password_confirmation: "hellokitty")
    visit root_path
  end
  describe "when visiting  '/' " do 
    it "has the title of the application" do 
      expect(page).to have_content("Welcome to Viewing Party Lite")
    end

    it "has a button to create a new user" do 
      expect(page).to have_button("Create a New User")
    end

    it "goes to the register page when clicking register user" do 
      click_button "Create a New User"
      expect(current_path).to eq("/register")
    end

    # commented out after adding a login for users/ what they are able to see
    # it " has a list of existing users, which links to the users dashboard" do 
     
    #   within(".users") do 
    #     expect(page).to have_content("Existing Users")
    #     expect(page).to have_link("#{@user_1.email}")
    #     expect(page).to have_link("#{@user_2.email}")
    #   end

    #   within(".users") do 
    #     click_link("#{@user_1.email}")
    #     expect(current_path).to eq(user_path(@user_1))
    #   end
    # end

    it "has a link to go back to the landing page(on the top of every page)" do 
      expect(page).to have_link("Home")

      visit user_path(@user_1)
      click_link "Home"

      expect(current_path).to eq(root_path)
      expect("Home").to appear_before("Welcome to Viewing Party Lite")
    end
  end
  describe "log in" do 
    it "has a link for log in" do 
      expect(page).to have_link "Log In"
    end

    it "redirects to a log in page" do 
      click_link "Log In"
      expect(current_path).to eq("/login")
    end
  end

  describe "once logged in" do 
    it "no longer has a link to log in or create an account" do 
      expect(page).to have_link("Log In")
      expect(page).to have_button("Create a New User")
      expect(page).to_not have_content("Log Out")

      click_link "Log In"

      expect(current_path).to eq("/login")

      fill_in(:email, with: @user_1.email)
      fill_in(:password, with: @user_1.password)

      click_on "Log In"

      expect(current_path).to eq(user_path(@user_1))

      visit root_path 

      expect(page).to_not have_link("Log In")
      expect(page).to_not have_button("Create a New User")
      expect(page).to have_content("Log Out")
    end

    it "when clicking link to log out, I am redirected to the welcome page" do 
      click_link "Log In"

      expect(current_path).to eq("/login")

      fill_in(:email, with: @user_1.email)
      fill_in(:password, with: @user_1.password)

      click_on "Log In"

      visit root_path 

      click_link "Log Out"

      expect(current_path).to eq(root_path)

      expect(page).to have_link("Log In")
      expect(page).to have_button("Create a New User")
      expect(page).to_not have_content("Log Out")
    end
  end

  describe " as a visitor" do 
    it "does not see the section of the pafe that lists existing users" do 
      expect(page).to_not have_content("Existing Users")
      expect(page).to_not have_link("#{@user_1.email}")
      expect(page).to_not have_link("#{@user_2.email}")
    end

    it "does not allow me to visit the dashboard page" do 
      visit user_path(@user_1)
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Please log in to view your dashboard")
    end
  end

  describe "as a registered user" do 
    it "has a list of existing users but only with a list of email addresses" do 
      expect(page).to_not have_content("Existing Users")
      expect(page).to_not have_content("#{@user_1.email}")
      expect(page).to_not have_content("#{@user_2.email}")
    end
  end
end