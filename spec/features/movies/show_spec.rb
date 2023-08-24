require "rails_helper"

RSpec.describe "Movie Show page" do
  before :each do
    @user1 = User.create!(name: "Bob", email: "bob@gmail.com", id: 1)
    @user2 = User.create!(name: "Jane", email: "jane@gmail.com", id: 2)
    @user3 = User.create!(name: "Tom", email: "tom@yahoo.com", id: 3)
    @movie_search = MovieFacade.new.search("Star Wars")
    @top_movies = MovieFacade.new.top_rated
    @cast = MovieFacade.new.cast(@top_movies.first.id)
    @reviews = MovieFacade.new.reviews(@top_movies.first.id)
    visit "/users/1/movies/#{@top_movies.first.id}"
  end
  describe "movie show page", :vcr do
    it "displays button to create viewing party and to return to Discover page" do
      
      expect(page).to have_button("Create Viewing Party for Movie")
      expect(page).to have_button("Discover Page")

    end

    it "displays movie details" do
      
      expect(page).to have_content(@top_movies.first.title)
      expect(page).to have_content(@top_movies.first.vote_average)
      expect(page).to have_content(@top_movies.first.genres.first)
      expect(page).to have_content(@top_movies.first.summary)
      expect(page).to have_content(@cast.first.name)
      expect(page).to have_content(@cast.first.character)
      expect(page).to have_content(@reviews.first.author)
      expect(page).to have_content(@reviews.first.content)
      expect(page).to have_content(@reviews.first.rating)
    end
  end
end