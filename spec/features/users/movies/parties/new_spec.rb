require 'rails_helper'

RSpec.describe 'User Story 12' do
  before(:each) do
    @user = create(:user, password: "test123", password_confirmation: "test123")
    @friend_1 = create(:user, password: "test123", password_confirmation: "test123")
    @friend_2 = create(:user, password: "test123", password_confirmation: "test123")
    @friend_3 = create(:user, password: "test123", password_confirmation: "test123")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

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
          expect(page).to have_field("Duration of Party")
          expect(page).to have_field(:duration, :with => 86)
          expect(page).to have_field("Day")
          expect(page).to have_field("Start Time")
        end
      end

      it "has each existing user in the system" do
        expect(page).to have_content(@friend_1.name)
        expect(page).to have_content(@friend_2.name)
        expect(page).to have_content(@friend_3.name)
      end

      xit "creates a new party" do
        fill_in "Duration of Party", with: 100
        fill_in :day, with: "12/02/23"
        fill_in :time, with: "8:00 PM"

        

        check @friend_1.name
        check @friend_2.name

        click_button "Create Party"

        # expect(Party.all.count).to eq(1)
      end
    end

    describe "sad path" do
      xit "does not create a party if party duration < movie.runtime" do

      end
    end
  end
end