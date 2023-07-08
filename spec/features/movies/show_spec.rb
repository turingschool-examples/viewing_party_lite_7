require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  before :each do
    @user1 = User.create!(user_name: "Bob", email: "bob@gmail.com")
    @user2 = User.create!(user_name: "Kate", email: "kate@gmail.com")
  end
  describe "top rated movies" do
    it 'redirects and displays movie title and vote average after clicking Find Top Rated Movies', :vcr do
      movies = MovieFacade.new.top_rated
      visit "/users/#{@user1.id}/discover"

      click_button("Find Top Rated Movies")

      expect(current_path).to eq("/users/#{@user1.id}/movies")
      expect(page).to have_link("The Shawshank Redemption")

      click_link("#{movies.first.title}")

      expect(current_path).to eq("/users/#{@user1.id}/movies/#{movies.first.id}")
    end
  end
  describe "search movies" do
    it 'redirects and displays movie title and vote average after clicking Find Movies', :vcr do
      visit "/users/#{@user1.id}/discover"
      movies = MovieFacade.new.search("The Matrix")

      fill_in "search", with: "The Matrix"

      click_button("Find Movies")

      expect(current_path).to eq("/users/#{@user1.id}/movies")
      expect(page).to have_link("The Matrix")

      click_link("#{movies.first.title}")

      expect(current_path).to eq("/users/#{@user1.id}/movies/#{movies.first.id}")
    end
  end

  describe "movie detail page" do
    it 'displays a button to create a viewing party', :vcr do
      movies = MovieFacade.new.top_rated
      visit "/users/#{@user1.id}/movies/#{movies.first.id}"

      expect(page).to have_button("Create Viewing Party")

      click_button("Create Viewing Party")

      expect(current_path).to eq("/users/#{@user1.id}/movies/#{movies.first.id}/viewing_party/new")
    end

    it 'displays a button to return to discover page', :vcr do
      movies = MovieFacade.new.top_rated
      visit "/users/#{@user1.id}/movies/#{movies.first.id}"

      expect(page).to have_button("Discover Movies")

      click_button("Discover Movies")

      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end

    it 'displays movie title, vote average, runtime, genre, summary, cast(10), count of reviews, and reviews(author name and info)', :vcr do
      movies = MovieFacade.new.top_rated
      visit "/users/#{@user1.id}/movies/#{movies.first.id}"

      expect(page).to have_content(movies.first.title)
      expect(page).to have_content(movies.first.vote_average)
      expect(page).to have_content(movies.first.runtime)
      expect(page).to have_content(movies.first.genres)
      expect(page).to have_content(movies.first.summary)
      expect(page).to have_content(movies.first.cast)
      expect(page).to have_content(movies.first.reviews.count)
      expect(page).to have_content(movies.first.reviews.first.author)
    end
  end

end