require "rails_helper"

RSpec.describe "Users Movie Index Result page", type: :feature do
  describe "when I visit the user movie index result page" do
    it "displays a discover button at the top of the page" do
      user_1 = User.create!(user_name: "Steve", email: "steve@email.com")
        visit user_movies_path(user_1)

        expect(page).to have_button("Discover Movies")
    end

    it "displays top rated movies" do
      user_1 = User.create!(user_name: "Steve", email: "steve@email.com")
      visit "/users/#{user_1.id}/movies?q=''"
      movies = MovieFacade.new.top_rated

      movies.each do |movie|
        movie.title
        expect(page).to have_content(movie.title)
      end
    end

    it "displays searched movies" do
      user_1 = User.create!(user_name: "Steve", email: "steve@email.com")
      visit "/users/#{user_1.id}/movies?search='king'"
      movies = MovieFacade.new.search("king")

      expect(movies.count).to eq(20)

      movies.each do |movie|
        movie.title
        expect(page).to have_content("King")
      end
    end
  end
end