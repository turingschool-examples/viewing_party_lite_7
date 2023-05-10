require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do
    visit root_path
  end

  scenario "displays title of Application" do
    expect(page).to have_content("Viewing Party")
  end

  scenario "has link to return to home page" do
    within 'nav' do
      expect(page).to have_link('Home', href: root_path)
    end
  end

  scenario "has button to create new user" do
    within "#create_user"
    expect(page).to have_link("Create New User")
    click_on "Create New User"

    expect(current_path).to eq("/register")
  end

  describe "list of existing users" do
    it "displays all existing users' emails as links to their dashboard" do
      @user_1 = create(:user)
      @user_2 = create(:user)
      @user_3 = create(:user)
      visit root_path

      within "#users" do
        expect(page).to have_link("#{@user_1.email}")
        expect(page).to have_link("#{@user_2.email}")
        expect(page).to have_link("#{@user_3.email}")

        click_on "#{@user_1.email}"
        expect(current_path).to eq("/user/#{@user_1.id}")
      end

      visit root_path
      within "users" do
        click_on "#{@user_3.email}"
        expect(current_path).to eq("/user/#{@user_3.id}")
      end
    end
  end
end