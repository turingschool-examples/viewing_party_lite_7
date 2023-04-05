require "rails_helper"

RSpec.describe "Admin Dashboard/Show Page" do 
  before(:each) do 
    @admin_user = User.create!(name: "Joe Admin-Man", email: "joey_smithy@yahooey.com", password: "hellokitty", role: 2)

    @user_1 = User.create!(name: "Joe NotAdmin - Smith", email: "just_joe@yahooey.com", password: "hellokitty")
    @user_2 = User.create!(name: "Sam Smith", email: "sam_smithy@yahooey.com", password: "hellokitty")

    visit login_path 
    fill_in(:email, with: @admin_user.email)
    fill_in(:password, with: @admin_user.password)

    click_on "Log In"

  end
  describe "When I log in as an admin user" do 
    it "takes me to my dashboard page" do 
      expect(current_path).to eq(admin_dashboard_path)
    end

    it "has a list of all default user's emails as links" do 
      expect(page).to have_link(@user_1.email)
      expect(page).to have_link(@user_2.email)
    end

    it "when clicking on a users email, it takes me to that users dashboard" do 
      click_link(@user_1.email)
      expect(current_path).to eq(admin_user_path(@user_1.id))
      expect(page).to have_content(@user_1.name)
      expect(page).to_not have_content(@user_2.name)
    end
  end

  describe "as a user or visitor, when I try to visit admin/dashboard" do
     it "redirects me to the landing page with an unauthorized message" do 
      visit root_path 
      click_link "Log Out"

      visit admin_dashboard_path 
      expect(current_path).to eq(root_path)
      expect(page).to have_content("You are not authorized to access this page")

       
      visit login_path 
      fill_in(:email, with: @user_1.email)
      fill_in(:password, with: @user_1.password)

      click_on "Log In"
      visit admin_dashboard_path 
      expect(current_path).to eq(root_path)
      expect(page).to have_content("You are not authorized to access this page")
    end
  end
end