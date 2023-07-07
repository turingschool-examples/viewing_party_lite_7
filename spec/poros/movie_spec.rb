require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    data = {
      id: 1,
      title: "Newest Movie",
      vote_average: 9.1
    }

    movie = Movie.new(data)

    expect(movie).to be_a(Movie)
    expect(movie.id).to eq(1)
    expect(movie.title).to eq("Newest Movie")
    expect(movie.vote_average).to eq(9.1)
  end
end
