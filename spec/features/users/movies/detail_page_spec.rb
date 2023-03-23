require "rails_helper"

RSpec.describe "Details Page", type: :feature do
  describe "When I visit a movie's detail page (/users/:user_id/movies/:movie_id where :id is a valid user id,I should see" do
    before :each do
      @user = create(:user)
      attrs = {
      id: 2,
      title: "The Godfather",
      vote_average: 8.7,
      runtime: 170,
      genres: [
      {
          "id": 18,
          "name": "Drama"
      },
      {
          "id": 80,
          "name": "Crime"
      }
      ],
      overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge."
    }
      movie = Movie.new(attrs)
      visit user_movie_path(@user, movie.id )
    end
    it "A Button to create a viewing party" do
      expect(page).to have_button("Create Viewing Party")
    end
  end
end