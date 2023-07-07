require 'rails_helper'

RSpec.describe 'Movie Show Page', :vcr do
  before :each do
    @user1 = User.create!(user_name: "Bob", email: "bob@gmail.com")
    @user2 = User.create!(user_name: "Kate", email: "kate@gmail.com")
  end
  describe "top rated movies" do
    it 'redirects and displays movie title and vote average after clicking Find Top Rated Movies' do
      movies = MovieFacade.new.top_rated
      visit "/users/#{@user1.id}/discover"

      click_button("Find Top Rated Movies")

      expect(current_path).to eq("/users/#{@user1.id}/movies")
      expect(page).to have_link("The Shawshank Redemption")

      click_link movies.first.title

      expect(current_path).to eq("/users/#{@user1.id}/movies/#{movies.first.id}")
    end
  end
  describe "search movies" do
    it 'redirects and displays movie title and vote average after clicking Find Movies' do
      visit "/users/#{@user1.id}/discover"
      movies = MovieFacade.new.search("The Matrix")

      fill_in "search", with: "The Matrix"

      click_button("Find Movies")

      expect(current_path).to eq("/users/#{@user1.id}/movies")
      expect(page).to have_link("The Matrix")

      click_link movies.first.title

      expect(current_path).to eq("/users/#{@user1.id}/movies/#{movies.first.id}")
    end
  end
end