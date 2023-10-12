require "rails_helper"

RSpec.describe "User Show Page" do
  describe "As an authenticated user", :vcr do
      before :each do
        @weston = User.create(name: "Weston", email: "IMaG@thehood.com")
        @movie = MovieFacade.movie_details(100)
        @cast = MovieFacade.movie_cast(100)
        @reviews = MovieFacade.movie_reviews(100)

        @party = @weston.viewing_parties.create(movie_id: 100, duration: 120, date: "2021-08-01", start_time: "12:00:00")
        @party.guests.create(name: "Weston", email: "IMaG@thehood.com")
      end

      xit "I see a list of all my viewing parties" do
        visit user_path(@weston)

        expect(page).to have_content("My Viewing Parties")
        expect(page).to have_content(@movie.title)
        expect(page).to have_content(@party.date)
      end
    end 
  end
