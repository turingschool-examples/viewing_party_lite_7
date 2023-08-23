require "rails_helper"

RSpec.describe Movie do
  describe "movie class", :vcr do
    it "exists and has attributes" do
      data = {  id: 238,
        title: "The Godfather",
        poster_path: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
        overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
        vote_average: 8.7,
        genres: [{id: 18, name: "Drama"}, {id: 80, name: "Crime"}],
        runtime: 175}
      movie = Movie.new(data)

      expect(movie).to be_a(Movie)
      expect(movie.id).to eq(238)
      expect(movie.title).to eq("The Godfather")
      expect(movie.image).to eq("/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")
      expect(movie.summary).to eq("Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.")
      expect(movie.vote_average).to eq(8.7)
      expect(movie.genres[0][:name]).to eq("Drama")
      expect(movie.genres[1][:name]).to eq("Crime")
      expect(movie.runtime).to eq(175)
    end
  end
end