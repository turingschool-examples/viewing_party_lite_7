require 'rails_helper'

# When I visit a movie's detail page (/users/:user_id/movies/:movie_id where :id is a valid user id,
# I should see

#  Button to create a viewing party
#  Button to return to the Discover Page
# Details This viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)

# And I should see the following information about the movie:

#  Movie Title
#  Vote Average of the movie
#  Runtime in hours & minutes
#  Genre(s) associated to movie
#  Summary description
#  List the first 10 cast members (characters&actress/actors)
#  Count of total reviews
#  Each review's author and information

RSpec.describe "Movie Detail page" do
  before(:each) do
    test_data
    test_movie_details
    @movie = Movie.new(@data)
  end
  describe "As a user, when I visit a movie's show page" do
    it "has a button to create a viewing party", :vcr do
      visit user_movie_path(@user_1.id, @movie.id)

      within("#create-vp") do
        expect(page).to have_button("Create Viewing Party for #{@movie.title}")
        click_button "Create Viewing Party for #{@movie.title}"
      end

      expect(current_path).to eq(new_user_movie_party_path(@user_1.id, @movie.id))
    end

    it "has a button to return to the discover page", :vcr do
      visit user_movie_path(@user_1.id, @movie.id)

      within("#return-to-discover") do
        expect(page).to have_button("Discover Page")
        click_button "Discover Page"
      end

      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end

    it "has the movie's information", :vcr do
      visit user_movie_path(@user_1.id, @movie.id)

      within("#movie-info") do
        expect(page).to have_content(@movie.title)
        expect(page).to have_content(@movie.vote_average)
        expect(page).to have_content(@movie.runtime)
        @movie.genres.each do |genre|
          expect(page).to have_content(genre)
        end
        expect(page).to have_content(@movie.overview)
      end
    end

    it "lists the first 10 cast members", :vcr do
      cast = MovieFacade.new.cast_members(@movie.id)
      visit user_movie_path(@user_1.id, @movie.id)

      within("#cast-members") do
        cast.each do |member|
          expect(page).to have_content(member)
        end
      end
    end

    it "has a count of reviews and each review's author and info", :vcr do
      reviews = MovieFacade.new.all_reviews(@movie.id)
      visit user_movie_path(@user_1.id, @movie.id)

      within("#reviews") do
      expect(page).to have_content("#{reviews.count} Reviews")
        reviews.each do |review|
            expect(page).to have_content(review.author)
            # expect(page).to have_content(review.content)
        end
      end
    end
  end
end