require 'rails_helper'

describe "New Viewing Party Page", :vcr do
  before do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)

    @movie = MoviesFacade.new(238, nil).movie_details

    visit user_movie_viewing_party_new_path(@user1.id, @movie.id)
  end

  describe "new viewing party form" do
    it "displays the movie title above a form" do
      within("#viewing-party-details") do
        expect(page).to have_content(@movie.title)
      end
    end

    xit "has a 'Duration of Party' field prefilled with the movie's runtime in minutes" do
      expect(page).to have_field("Duration of Party", with: @movie.runtime)
    end

    xit "has date and time selection fields" do
      expect(page).to have_field("When", type: "date")
      expect(page).to have_field("Start Time", type: "time")
    end

    xit "has individual checkboxes to invite every other existing user" do
      expect(page).to have_checked_field("#{@user2.name} (#{@user2.email})")
      expect(page).to have_checked_field("#{@user3.name} (#{@user3.email})")

      expect(page).to_not have_checked_field("#{@user1.name} (#{@user1.email})")
    end

    xit "has a button to create a party" do
      expect(page).to have_button("Create Party").once
    end
  end

  describe "happy path" do
    xit "redirects to the user's dashboard where the new event is shown" do
      
    end
  end

  describe "sad path" do
    xit "will return an error if the party's duration is less than the film's duration" do

    end
  end

  
end
