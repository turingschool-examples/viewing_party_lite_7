require 'rails_helper'

RSpec.describe Movie do
  it "exists" do
    attrs = {
      title: "Hot Dog",
      vote_average: 1.0,
      overview: "A movie about a hot dog"
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq("Hot Dog")
    expect(movie.vote_average).to eq(1.0)
    expect(movie.overview).to eq("A movie about a hot dog")
  end
end