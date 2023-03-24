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
      end

      it "has a form to create a new viewing party (Duration, Day, and Start Time)" do
        within "#party_form" do
          save_and_open_page
          expect(page).to have_field("Duration of Party")
          expect(page).to have_field(:duration, :with => 86)
          expect(page).to have_field("Day")
          expect(page).to have_field("Start Time")
        end
      end

      it "has each existing user in the system with checkboxes to select invitees" do
        within "#user_#{@friend_1.id}" do
          expect(page).to have_content("#{@friend_1.name} (#{@friend_1.email})")
          check :user_id
        end

        within "#user_#{@friend_2.id}" do
          expect(page).to have_content("#{@friend_2.name} (#{@friend_2.email})")
          check :user_id
        end

        within "#user_#{@friend_3.id}" do
          expect(page).to have_content("#{@friend_3.name} (#{@friend_3.email})")
          check :user_id
        end
      end

      it "creates a new party" do
        fill_in "Duration of Party", with: 100
        fill_in "Day", with: "12/02/23"
        fill_in "Start Time", with: "7:00 pm"

        click_button "Create Party"

        expect(current_path).to eq(dashboard_path(@user))
        expect(page).to have_content("You have created a new viewing party!")
      end
    end

    describe "sad path" do
      xit "does not create a party if party duration < movie.runtime" do

      end
    end
  end
end