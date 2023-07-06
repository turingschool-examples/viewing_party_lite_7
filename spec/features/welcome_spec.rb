require "rails_helper"

RSpec.describe "/", type: :feature do
  before(:each) do
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)
    visit root_path
  end

  describe "When a user visits the root path" do
    it "should be on the landing page ('/') and I see the title of the applications" do
      expect(page).to have_content("Viewing Party")
    end

    it "I see a button to create a new user" do
      expect(page).to have_button("Create a New User")

      click_button "Create a New User"

      expect(current_path).to eq(register_index_path)
    end

    it "I see a list of existing users which links to the their dashboard" do
      expect(page).to have_content("Existing Users")

      within "#user_#{@user_1.id}" do
        expect(page).to have_content(@user_1.email)
      end
      within "#user_#{@user_2.id}" do
        expect(page).to have_content(@user_2.email)
      end
      within "#user_#{@user_3.id}" do
        expect(page).to have_content(@user_3.email)
      end
    end

    it "I see a link (Home) that will take me back to the welcome page" do
      expect(page).to have_link("Home")

      click_link("Home")

      expect(current_path).to eq(root_path)
    end
  end
end
