require "rails_helper"

RSpec.describe "Users show page", type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Scott DeVoss", email: "scottd@gmail.com")
    @user2 = User.create!(name: "Cory Powell", email: "coryp@yahoo.com")
  end
  # When I visit '/users/:id' where :id is a valid user id,
  # I should see:
  # "<user's name>'s Dashboard" at the top of the page
  # A button to Discover Movies*
  # A section that lists viewing parties**
  # *more instructions on this in the Dashboard:Discover Movies issue.
  # **more instructions on this in the Dashboard:Viewing Parties issue.

  describe "When I visit '/users/:id'" do
    it "should show '<user's name> Dashboard' at the top of the page" do
      visit "/users/#{@user1.id}"

      expect(page).to have_content("#{@user1.name}'s Dashboard")
    end

    it "should have a button to 'Discover Movies'" do
      visit "/users/#{@user1.id}"

      expect(page).to have_button("Discover Movies")
    end

    it "should have a section that lists viewing parties" do
      visit "/users/#{@user1.id}"

      expect(page).to have_content('Viewing Parties:')
    end
  end
end
