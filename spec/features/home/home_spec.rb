require "rails_helper"

RSpec.describe "Home", type: :feature do
  before(:each) do
    @user_1 = create(:user, password: "test123", password_confirmation: "test123")
    @user_2 = create(:user, password: "test123", password_confirmation: "test123")
    @user_3 = create(:user, password: "test123", password_confirmation: "test123")

    visit root_path
  end

  describe "User Story 4" do
    it "shows the Home page with the name of the app and a button to create a new user" do
      expect(page).to have_content("Viewing Party")
      expect(page).to have_link("Create New User")

      click_link "Create New User"
      expect(current_path).to eq(register_path)
    end

    it "shows the existing users as a link to their dashboard (when logged in)" do
      click_link "Log In"
      fill_in :email, with: @user_1.email
      fill_in :password, with: @user_1.password
      click_button "Log In"
      visit root_path

      within("#user_#{@user_1.id}") do
        expect(page).to have_content("#{@user_1.name} - #{@user_1.email}")
        expect(page).to_not have_link("#{@user_1.name} - #{@user_1.email}", href: user_path(@user_1.id))
      end
      within("#user_#{@user_2.id}") do
        expect(page).to have_content("#{@user_2.name} - #{@user_2.email}")
        expect(page).to_not have_link("#{@user_2.name} - #{@user_2.email}", href: user_path(@user_2.id))
      end
      within("#user_#{@user_3.id}") do
        expect(page).to have_content("#{@user_3.name} - #{@user_3.email}")
        expect(page).to_not have_link("#{@user_3.name} - #{@user_3.email}", href: user_path(@user_3.id))
      end
    end

    it "has a link to the Home page" do
      expect(page).to have_link("Home", href: root_path)
    end
  end


  describe "Authorization Challenge" do
    describe "User Story 1" do
      it "does not show the existing users when not logged in" do
        expect(page).to_not have_content(@user_1.name)
        expect(page).to_not have_content(@user_2.name)
        expect(page).to_not have_content(@user_3.name)
      end
    end

    describe "User Story 2" do
      it "the list of users gives email addresses, but are NOT links" do
        # see modifications to above test
        # it "shows the existing users as a link to their dashboard (when logged in)" do
      end
    end
  end
end
