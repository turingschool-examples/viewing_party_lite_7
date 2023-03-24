require 'rails_helper'

RSpec.describe Search do
  it "exists" do
    attrs = {
      title: "Hot Dog",
      vote_average: 1.0
    }

    movie = Search.new(attrs)

    expect(movie).to be_a(Search)
    expect(movie.title).to eq("Hot Dog")
    expect(movie.vote_average).to eq(1.0)
  end
end