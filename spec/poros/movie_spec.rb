require "rails_helper"


RSpec.describe Movie do
  it "exists and has attributes" do
    attrs = {
      "backdrop_path": "/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg",
      "genres": [
          {
              "id": 18,
              "name": "Drama"
          },
          {
              "id": 80,
              "name": "Crime"
          }
      ],
      "id": 238,
      "overview": "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
      "runtime": 175,
      "title": "The Godfather",
      "vote_average": 8.7
  }

  movie = Movie.new(attrs)

  expect(movie).to be_a Movie

  expect(movie.title).to eq("The Godfather")
  expect(movie.vote_average).to eq(8.7)
  expect(movie.id).to eq(238)
  expect(movie.genres).to eq([{"id": 18, "name": "Drama"},{"id": 80,"name": "Crime"}])
  expect(movie.image).to eq("/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg")
  expect(movie.summary).to eq("Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.")
  expect(movie.runtime).to eq(175)
  end
end