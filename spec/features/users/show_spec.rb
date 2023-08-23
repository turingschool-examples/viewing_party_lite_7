require 'rails_helper'

RSpec.describe "User Dashboard page '/users/:id'", type: :feature do
  before(:each) do
    @user_1 = User.create!(name: "Jimmy", email: "movie_buff333@gmail.com")
    @user_2 = User.create!(name: "Timmy", email: "i_hate_movies@gmail.com")
    @user_3 = User.create!(name: "Tammy", email: "gamer4134@gmail.com")
  end

  describe "When I visit a user's dashboard page" do
    it "Displays the user's name at the top of the page" do
      visit dashboard_path(@user_1.id)

      expect(page).to have_content("#{@user_1.name}'s Dashboard")
      expect(page).to_not have_content("#{@user_2.name}'s Dashboard")
      expect(page).to_not have_content("#{@user_3.name}'s Dashboard")
    end

    it "Has a button to discover movies" do
      visit dashboard_path(@user_1.id)

      within "#discover_movies" do
        expect(page).to have_button("Discover Movies")
        click_button("Discover Movies")
      end
      expect(current_path).to eq(discover_path(@user_1.id))
      expect(current_path).to_not eq(discover_path(@user_2.id))
    end

    it "Has a section that lists viewing parties" do
      visit dashboard_path(@user_1.id)

      expect(page).to have_css("#viewing_parties")
      # within "#viewing_parties" do
      ## More tests will go here after api consumption is implemented
      # end
    end
  end
end