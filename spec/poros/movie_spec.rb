require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    attrs = {
      id: 2,
      title: "The Godfather",
      vote_average: 8.7
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("The Godfather")
    expect(movie.id).to eq(2)
    expect(movie.vote_average).to eq(8.7)
  end
end