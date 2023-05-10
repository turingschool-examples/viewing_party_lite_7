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
      @user_1 = User.create!(id: 1, name: "User 1", email: "User1@gmail.com")
      @user_2 = User.create!(id: 2, name: "User 2", email: "User2@gmail.com")
      @user_3 = User.create!(id: 3, name: "User 3", email: "User3@gmail.com")
      visit root_path

      within "#users" do
        expect(page).to have_link("User1@gmail.com")
        expect(page).to have_link("User2@gmail.com")
        expect(page).to have_link("User3@gmail.com")

        click_on "User1@gmail.com"
        expect(current_path).to eq("/user/#{@user_1.id}")
      end

      visit root_path
      within "users" do
        click_on "User3@gmail.com"
        expect(current_path).to eq("/user/#{@user_3.id}")
      end
    end
  end
end