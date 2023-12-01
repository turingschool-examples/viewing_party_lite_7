require "rails_helper"

RSpec.describe User, type: :feature do
  before :each do
    @user_1 = create(:user)
    @movie = nil # godfather id is 238
  end

  describe "User Dashboard Page" do
    # US 3
    it "displays a specific user dashboard attributes" do
      visit user_path(@user_1)

      expect(page).to have_content("#{@user_1.name}'s Dashboard")
      expect(page).to have_button("Discover Movies")
    end

    # As a user,
    # When I visit a user dashboard,
    # I should see the viewing parties that the user has been invited to with the following details:

    # Movie Image
    # Movie Title, which links to the movie show page
    # Date and Time of Event
    # who is hosting the event
    # list of users invited, with my name in bold
    # I should also see the viewing parties that the user has created with the following details:

    # Movie Image
    # Movie Title, which links to the movie show page
    # Date and Time of Event
    # That I am the host of the party
    # List of friends invited to the viewing party
    describe "displays the viewing parties the user has been invited to" do
      it "should display the movie image, title as a redirect link," do
        visit user_path(@user_1)
      end
    end
  end
end
