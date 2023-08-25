require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    movie_data = {
      title: "The Godfather",
      id: 12345,
      vote_average: 8.7,
      runtime: "2h 55m",
      genres: ["Crime", "Drama"],
      summary: "A classic crime drama film."
    }

    movie = Movie.new(**movie_data)

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq("The Godfather")
    expect(movie.id).to eq(12345)
    expect(movie.vote_average).to eq(8.7)
    expect(movie.runtime).to eq("2h 55m")
    expect(movie.genres).to eq(["Crime", "Drama"])
    expect(movie.summary).to eq("A classic crime drama film.")
  end
end