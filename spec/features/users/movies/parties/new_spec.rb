require 'rails_helper'

RSpec.describe 'User Story 12' do
  before(:each) do
    @user = create(:user)
    @friend_1 = create(:user)
    @friend_2 = create(:user)
    @friend_3 = create(:user)

    VCR.use_cassette(:batman_doom, serialize_with: :json, :record => :new_episodes) do
      visit new_user_movie_viewing_party_path(@user, 1003579)
    end
  end

  describe "New Viewing Party Page" do
    describe "happy path" do
      it "shows the name of the movie title" do
        expect(page).to have_content("Batman: The Doom That Came to Gotham")

        # VCR.eject_cassette(:batman_doom)
      end

      it "has a form to create a new viewing party (Duration, Day, and Start Time)" do
        within "#party_form" do
          save_and_open_page
          expect(page).to have_field("Duration of Party")
          expect(page).to have_field(:duration, :with => 86)
          expect(page).to have_field("Day")
          expect(page).to have_field("Start Time")
        end

        # VCR.eject_cassette(:batman_doom)
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