require 'rails_helper'

RSpec.describe Movie do
  it "exists" do
    attrs = {
      title: "Hot Dog",
      vote_average: 1.0,
      overview: "A movie about a hot dog",
      runtime: 100,
      genres: "comedy",
      cast: [{ name: "Bob", character: "Hot Dog" },{ name: "Leonardo Dicaprio", character: "Hot Dog 2" }],
      results: [{ author: "steve", content: "This movie is great" }],
      total_results: 3
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq("Hot Dog")
    expect(movie.vote_average).to eq(1.0)
    expect(movie.summary).to eq("A movie about a hot dog")
    expect(movie.runtime).to eq(100)
    expect(movie.genres).to eq("comedy")
    expect(movie.cast).to eq({ "Bob"=>"Hot Dog", "Leonardo Dicaprio"=>"Hot Dog 2" })
    expect(movie.reviews).to eq({ "steve"=>"This movie is great" })
  end
end