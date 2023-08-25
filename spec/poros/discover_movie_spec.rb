require 'rails_helper'

RSpec.describe DiscoverMovie do
  it "exists" do
    attrs = {
      id: 2,
      title: "Batman",
      vote_average: 7,
      runtime: 90,
      genre: ["Action"],
      overview: "A rich guy with a dark private life",
      top_10: ["bob", "fred", "jill", "tim", "nancy", "arron","dolly", "nick", "bill", "sue"],
      total_reviews: 100,
      review_authors: "trollsalot"
    }
   
    discover_movie = DiscoverMovie.new(attrs)

    expect(discover_movie.id).to eq(2)
    expect(discover_movie).to be_a(DiscoverMovie)
    expect(discover_movie.title).to eq("Batman")
    expect(discover_movie.vote_average).to eq(7)
    expect(discover_movie.runtime).to eq(90)
    expect(discover_movie.genre).to eq(["Action"])
    expect(discover_movie.overview).to eq("A rich guy with a dark private life")
    expect(discover_movie.top_10).to eq(["bob", "fred", "jill", "tim", "nancy", "arron","dolly", "nick", "bill", "sue"])
    expect(discover_movie.total_reviews).to eq(100)
    expect(discover_movie.review_authors).to eq("trollsalot")
  end
end