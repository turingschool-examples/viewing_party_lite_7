require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before(:each) do
    @sally = User.create!(name: "Sally", email: "bettercallsal@gmail.com")
    @alex = User.create!(name: "Alex", email: "alexthegreat@gmail.com")
  end
  describe "As a user when I visit /users/:id" do
    it "I see '<user name>'s Dashboard" do
      visit user_path(@sally)

      expect(page).to have_content("Sally's Dashboard")
    end

    it "I see a button to discover movies" do
      visit user_path(@sally)

      expect(page).to have_button("Discover Movies")
    end

    it "I see a section that lists viewing parties" do
      visit user_path(@sally)

      within(".viewing_parties") do
        expect(page).to have_content(@party1.movie)
      end
    end
  end
end