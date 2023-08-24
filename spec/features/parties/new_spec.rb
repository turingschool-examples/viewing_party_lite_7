require "rails_helper"

RSpec.describe Party do
  describe "new viewing party", :vcr do
    before do
    @user1 = User.create!(name: "Bob", email: "bob@gmail.com", id: 1)
    @user2 = User.create!(name: "Jane", email: "jane@gmail.com", id: 2)
    @user3 = User.create!(name: "Tom", email: "tom@yahoo.com", id: 3)
    @movie_search = MovieFacade.new.search("Star Wars")
    @top_movies = MovieFacade.new.top_rated
    @cast = MovieFacade.new.cast(@top_movies.first.id)
    @reviews = MovieFacade.new.reviews(@top_movies.first.id)
    @find_movie = MovieFacade.new.find_movie(@top_movies.first.id)
    visit "/users/1/movies/#{@top_movies.first.id}/parties/new"
  end
    it "returns name of movie" do
      visit "/users/1/movies/#{@top_movies.first.id}"
      click_button "Create Viewing Party for Movie"

      expect(current_path).to eq("/users/1/movies/#{@top_movies.first.id}/parties/new")
    end

    it "has a button to discover page" do
      click_button "Discover Page"

      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end

    it "has a form to create a new viewing party" do
      fill_in :duration, with: 175
      fill_in :date, with: "12/02/23"
      fill_in :start_time, with: "7:00"

      expect(page).to have_unchecked_field(@user2.email)
      expect(page).to have_unchecked_field(@user3.email)

      check(@user2.email)

      expect(page).to have_checked_field(@user2.email)
      
      click_button "Create Party"
      expect(current_path).to eq("user/#{@user1.id}")
    end
  end
end