require "rails_helper"

RSpec.describe Movie do
  it "exists" do
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

    expect(movie).to be_a Movie
    expect(movie.title).to eq("The Godfather")
    expect(movie.id).to eq(2)
    expect(movie.vote_average).to eq(8.7)
    expect(movie.runtime).to eq(170)
    expect(movie.genres).to eq(["Drama", "Crime"])
    expect(movie.summary).to eq("Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.")
  end
end