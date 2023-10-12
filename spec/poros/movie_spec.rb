require 'rails_helper'

RSpec.describe Movie do 
  describe "initialize" do
    it "creates a movie object" do
      movie_data = {
        id: 1,
        original_title: "Forrest Gump",
        vote_average: 8.2,
        runtime: 142,
        genres: [
          {
              "id": 35,
              "name": "Comedy"
          },
          {
              "id": 12,
              "name": "Adventure"
          },
          {
              "id": 14,
              "name": "Fantasy"
          }
      ],
        overview: "A movie about a guy named Forrest Gump" 
      }

      movie = Movie.new(movie_data)
      expect(movie).to be_a(Movie)
      expect(movie.id).to eq(1)
      expect(movie.title).to eq("Forrest Gump")
      expect(movie.vote_average).to eq(8.2)
      expect(movie.runtime).to eq(142)
      expect(movie.genres).to be_a(Array)
      expect(movie.genres[0]).to be_a(Hash)
    end
  end
end