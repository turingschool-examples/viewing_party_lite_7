require 'rails_helper'

RSpec.describe DiscoverMovie do
  it "exists" do
    attrs = {
      title: "Batman",
      vote_average: 7,
      runtime: nil,
      genre_ids: [13],
      overview: "A rich guy with a dark private life",
      top_10: nil,
      vote_count: 100,
      review_authors: nil
    }
   
    discover_movie = DiscoverMovie.new(attrs)

    expect(discover_movie).to be_a(DiscoverMovie)
    expect(discover_movie.title).to eq("Batman")
    expect(discover_movie.vote_average).to eq(7)
    expect(discover_movie.runtime).to be nil
    expect(discover_movie.genre_ids).to eq([13])
    expect(discover_movie.overview).to eq("A rich guy with a dark private life")
    expect(discover_movie.top_10).to be nil
    expect(discover_movie.vote_count).to eq(100)
    expect(discover_movie.review_authors).to be nil
  end
end