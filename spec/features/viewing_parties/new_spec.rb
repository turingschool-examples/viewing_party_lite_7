require 'rails_helper'

describe "New Viewing Party Page" do
  before do
    VCR.use_cassette("godfather-movie-details") do
      @user1 = User.create(name: "Ethan", email: "ethan@ethan.com")
      @user2 = User.create(name: "Chris", email: "chris@chris.com")
      @user3 = User.create(name: "Vito", email: "vito@corleone.com")

      @movie = MoviesFacade.new(238, nil).movie_details

      visit user_movie_viewing_party_new_path(@user1.id, @movie.id)
    end
  end

  describe "new viewing party form" do
    it "displays the movie title above a form" do
      expect(page).to have_content(@movie.title)
    end

    it "has a 'Duration of Party' field prefilled with the movie's runtime in minutes" do
      expect(page).to have_field("Duration of Party", with: @movie.runtime)
    end

    it "has date and time selection fields" do
      expect(page).to have_field("When", type: "date")
      expect(page).to have_field("Start Time", type: "time")
    end

    it "has individual checkboxes to invite every other existing user" do
      expect(page).to have_unchecked_field("#{@user2.name} (#{@user2.email})")
      expect(page).to have_unchecked_field("#{@user3.name} (#{@user3.email})")

      expect(page).to_not have_checked_field("#{@user1.name} (#{@user1.email})")
    end

    it "has a button to create a party" do
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
