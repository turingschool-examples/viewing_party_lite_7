require "rails_helper"

RSpec.describe "user discover page" do
  before :each do
    @user1 = User.create!(name: "Bob", email: "bob@gmail.com", id: 1)
    @user2 = User.create!(name: "Jane", email: "jane@gmail.com", id: 2)
    @user3 = User.create!(name: "Tom", email: "tom@yahoo.com", id: 3)
  end
  describe "discover page", :vcr do
    it "has a links to find top rated movies and search" do
      visit "/users/#{@user1.id}/discover"

      expect(page).to have_content("Discover Movies")
      expect(page).to have_button("Find Top Rated Movies")
      expect(page).to have_button("Find Movies")
    end
  end
end