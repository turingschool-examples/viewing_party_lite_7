require 'rails_helper'

RSpec.describe 'Application landing page' do
  describe 'landing page view' do
    it "has title header with create user button" do
      visit root_path

      expect(page).to have_content("Movie Viewing Party!")
      expect(page).to have_link "Already have an account - Login"
      expect(page).to have_button "Create New User"
      expect(page).to_not have_content "Movie Viewing Users:"
    end

    it 'has link to return to landing page' do
      visit root_path
      expect(page).to have_link "Return to Movie Viewing Party Landing Page"
      click_link "Return to Movie Viewing Party Landing Page"
      expect(current_path).to eq "/"
    end

    it "has link to login form" do
      visit root_path
      within "#title" do
        expect(page).to have_link "Already have an account - Login"

        click_link "Already have an account - Login"
        expect(current_path).to eq login_path
      end
    end
  end

  describe "landing page sessions" do
    before :each do
      @user = User.create!(name: "Email", email: "email@email.com", password: "secretpassword")
    end

    it "does not show current users to visitors" do
      visit root_path

      expect(page).to have_link "Already have an account - Login"
      expect(page).to have_button "Create New User"
      expect(page).to_not have_link "#{@user.name}"
      expect(page).to_not have_content "Movie Viewing Users:"
    end
  end
end