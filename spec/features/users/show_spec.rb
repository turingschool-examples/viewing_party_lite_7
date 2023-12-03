require 'rails_helper'

RSpec.describe 'Users show page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Scott DeVoss', email: 'scottd@gmail.com')
    @user2 = User.create!(name: 'Cory Powell', email: 'coryp@yahoo.com')
  end

  describe "When I visit '/users/:id'" do
    it "should show '<user's name> Dashboard' at the top of the page" do
      visit "/users/#{@user1.id}"

      expect(page).to have_content("#{@user1.name}'s Dashboard")
    end

    it "should have a button to 'Discover Movies'" do
      visit "/users/#{@user1.id}"

      expect(page).to have_button('Discover Movies')
    end

    it 'should have a section that lists viewing parties' do
      visit "/users/#{@user1.id}"

      expect(page).to have_content('Viewing Parties:')
    end

    it "when I go to a user dashboard, and click on 'Discover Movies' I am redirected to a discover
    page /users/:id/discover, where :id is the user id of the user who's dashboard I was just on" do
      visit "/users/#{@user1.id}"

      click_button('Discover Movies')

      expect(current_path).to eq("/users/#{@user1.id}/discover")
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
    xit 'I should see the viewing parties that the user has been invited to with the details: Movie Image, Movie Title
    (link to movie show page), Date and Time of event, that the user is the host of the party, and list of friends
    invited to the viewing party' do

    end
  end
end
