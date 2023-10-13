require "rails_helper"
require "pry"

RSpec.describe "User Show Page" do
  describe "As an authenticated user", :vcr do
      before :each do
        @user = User.create!(name: "Weston", email: "IMaG@thehood.com")
        @movie_details = MovieFacade.movie_details(100)
        @movie = Movie.create!(
          id: @movie_details.id,
          title: @movie_details.title,
          vote_average: @movie_details.vote_average,
          runtime: @movie_details.runtime,
          genres: @movie_details.genres,
          description: @movie_details.description
        )

        @viewing_parties = ViewingParty.create!(movie_id: @movie.id, user_id: @user.id, date_time: "2021-08-01 01:00:00", is_host: true)
      end

      it "displays user dashboard details" do
        visit user_path(@user.id)

        expect(page).to have_content("#{@user.name}'s Dashboard")
        expect(page).to have_content("Viewing Parties")
        expect(page).to have_content(@movie.title)
      end
    end 
  end
