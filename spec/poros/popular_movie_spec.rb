require "rails_helper"

RSpec.describe PopularMovie do
  it "exists" do
    attrs = {
      id: 5555,
      title: "Ace Ventura",
      vote_average: 10
    }

    movie = PopularMovie.new(attrs)

    expect(movie).to be_a PopularMovie
    expect(movie.id).to eq(5555)
    expect(movie.title).to eq("Ace Ventura")
    expect(movie.vote_average).to eq(10)
  end
end