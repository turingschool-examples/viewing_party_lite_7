require "rails_helper"

RSpec.describe User, type: :feature do
  before :each do
    @user_1 = create(:user)
    @user_2 = create :user

    VCR.use_cassette("godfather-movie-details") do
      m = MovieFacade.movie(238)  # The Godfather
      @movie_1 = Movie.create!(
        id: m.id,
        title: m.title,
        runtime: m.runtime,
        poster_path: m.poster_path
      )
    end

    VCR.use_cassette("fastball-movie-details") do
      m = MovieFacade.movie(330068)  # Fastball
      @movie_2 = Movie.create!(
        id: m.id,
        title: m.title,
        runtime: m.runtime,
        poster_path: m.poster_path
      )
    end

    @viewing_party1 = create(
      :viewing_party,
      duration: 120,
      time: "12:30:00",
      host_id: @user_1.id,
      movie_id: @movie_1.id
    )
    @viewing_party2 = create(
      :viewing_party,
      duration: 120,
      time: "17:15:00",
      host_id: @user_2.id,
      movie_id: @movie_2.id
    )

    PartyUser.create!(user: @user_1, viewing_party: @viewing_party1)
    PartyUser.create!(user: @user_1, viewing_party: @viewing_party2)
    PartyUser.create!(user: @user_2, viewing_party: @viewing_party1)
    PartyUser.create!(user: @user_2, viewing_party: @viewing_party2)
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
    describe "displays the viewing parties the user is associated to" do
      it "should display the movie image, title as a redirect link," do
        visit user_path(@user_1)

        expect(page).to have_content("#{@user_1.name}'s Dashboard")
        expect(page).to have_button("Discover Movies")

        @user_1.viewing_parties.each do |party|
          within("#party-#{party.id}") do
            expect(page).to have_link(party.movie.title)
            expect(page).to have_content(party.user_status(@user_1.id))
          end
        end
      end
    end
  end
end
