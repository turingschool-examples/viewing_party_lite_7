require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  before :each do
    @user1 = User.create!(user_name: "Bob", email: "bob@gmail.com", password: 'password123', password_confirmation: 'password123')
    @user2 = User.create!(user_name: "Kate", email: "kate@gmail.com",password: 'password23', password_confirmation: 'password23')
  end
  describe "top rated movies" do
    it 'redirects and displays movie title and vote average after clicking Find Top Rated Movies', :vcr do
      movies = MovieFacade.new.top_rated
      visit discover_index_path

      click_button("Find Top Rated Movies")

      expect(current_path).to eq(movies_path)
      expect(page).to have_link("The Shawshank Redemption")

      click_link("#{movies.first.title}")

      expect(current_path).to eq(movie_path(movies.first.id))
    end
  end
  describe "search movies" do
    it 'redirects and displays movie title and vote average after clicking Find Movies', :vcr do
      visit discover_index_path
      movies = MovieFacade.new.search("The Matrix")

      fill_in "search", with: "The Matrix"

      click_button("Find Movies")

      expect(current_path).to eq(movies_path)
      expect(page).to have_link("The Matrix")

      click_link("#{movies.first.title}")

      expect(current_path).to eq(movie_path(movies.first.id))
    end
  end

  describe "movie detail page" do
    it 'displays a button to create a viewing party', :vcr do
      user_1 = User.create!(user_name: "Pal", email: "pal@email.com", password: 'password123', password_confirmation: 'password123')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)


      movies = MovieFacade.new.top_rated
      visit movie_path(movies.first.id)

      expect(page).to have_button("Create Viewing Party")

      click_button("Create Viewing Party")

      expect(current_path).to eq(movie_path(movies.first.id))
    end

    it 'displays a button to return to discover page', :vcr do
      movies = MovieFacade.new.top_rated
      visit movie_path(movies.first.id)
      expect(page).to have_button("Discover Movies")

      click_button("Discover Movies")

      expect(current_path).to eq(discover_index_path)
    end

    it 'displays movie title, vote average, runtime, genre, summary, cast(10), count of reviews, and reviews(author name and info)', :vcr do
      movies = MovieFacade.new.top_rated
      reviews = MovieFacade.new.reviews(movies.first.id)
      cast = MovieFacade.new.cast(movies.first.id)
      visit movie_path(movies.first.id)


      expect(page).to have_content(movies.first.title)
      expect(page).to have_content(movies.first.vote_average)
      expect(page).to have_content(movies.first.runtime)
      expect(page).to have_content(movies.first.genres)
      expect(page).to have_content(movies.first.summary)
      expect(page).to have_content(cast.first.name)
      expect(page).to have_content(cast.first.character)
      expect(page).to have_content(reviews.count)
      expect(page).to have_content(reviews.first.author)
      expect(page).to have_content(reviews.last.content)
      expect(page).to have_content(reviews.first.rating)
    end
  end

  describe 'as a visitor' do
    it 'redirects to the movie show page when not logged in after clicking create viewing party', :vcr do
      movie = MovieFacade.new.find_movie(11)

      visit movie_path(movie.id)
      click_on "Create Viewing Party"

      expect(current_path).to eq(movie_path(movie.id))
      expect(page).to have_content("You must be logged in to create a viewing party")
    end
  end
end