require 'rails_helper'

RSpec.describe "Movies Show page", type: :feature do
  describe "When I visit the movies show page" do
    before(:each) do
      @user = User.create!(name: "Kiwi", email: "kiwibird@gmail.com")
      @movie_id = 926393

      credits_response = File.read("spec/fixtures/movie_credits.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/926393/credits?api_key=#{Rails.application.credentials.tmdb[:key]}").
         to_return(status: 200, body: credits_response)

      reviews_response = File.read("spec/fixtures/movie_reviews.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/926393/reviews?api_key=#{Rails.application.credentials.tmdb[:key]}").
         to_return(status: 200, body: reviews_response)

      visit user_movie_path(@user.id, @movie_id)
    end

    it "I see the following movie details: title, vote average, runtime, genres, summary" do
      expect(page).to have_content("The Equalizer 3")
      expect(page).to have_content("Average Vote: ")
      expect(page).to have_content("Runtime: 1h 49m")
      expect(page).to have_content("Genre(s): Action Thriller Crime Drama")
      expect(page).to have_content("Summary: Robert McCall finds himself at home in Southern")
    end

    it "I see the first 10 cast members as well as their characters listed" do
      expect(page).to have_content("Denzel Washington - Robert McCall")
      expect(page).to have_content("Sonia Ammar - Chiara Bonucci")
    end

    it "I see the total number of reviews as well as all reviews and their authors" do
      expect(page).to have_content("Reviews (2 total)")

      expect(page).to have_content("CinemaSerf")
      expect(page).to have_content("Anyone remember the little tune")

      expect(page).to have_content("MovieGuys")
      expect(page).to have_content("The new Equalizer film")
    end

    it "There is a button to return to the discover page" do
      page.has_link?("Discover Movies", href: user_discover_index_path(@user.id))
    end

    it "There is a button to create a new viewing party" do
      page.has_link?("Create a Viewing Party", href: new_user_movie_viewing_party_path(@user.id, @movie_id))
    end
  end
end