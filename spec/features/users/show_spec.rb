require 'rails_helper'

RSpec.describe 'users' do
  before do
    @user_1 = User.create!(name: "Ringo", email: "ringo@gmail.com")

    visit user_path(@user_1)
  end

  describe 'dashboard' do

    it "has user name" do
      expect(page).to have_content("Ringo's Dashboard")
    end

    it "has button to Discover Movies page" do
      expect(page).to have_button("Discover Movies")
    end

    it "lists viewing parties" do

    end
  end
end