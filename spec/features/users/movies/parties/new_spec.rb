require 'rails_helper'

Rspec.describe 'User Story 12' do
  before(:each) do
    # create users with factorybot/faker
    # use batman vcr
    # visit /users/:user_id/movies/:movid_id/viewing-party/new, where :user_id is a valid user's id)
  end

  describe "New Viewing Party Page" do
    describe "happy path" do
      xit "shows the name of the movie title" do
        expect(page).to have_content("Batman: The Doom That Came to Gotham")
      end

      xit "has a form to create a new viewing party (Duration, Day, and Start Time)" do
        within "#party_form" do
          expect(page).to have_field("Duration of Party", value => 86)
          expect(page).to have_field("Day")
          expect(page).to have_field("Start Time")
        end
      end

      xit "has Checkboxes next to each existing user in the system to select invitees" do
        
      end
    end

    describe "sad path" do
      xit "does not create a party if party duration < movie.runtime" do

      end
    end
  end
end