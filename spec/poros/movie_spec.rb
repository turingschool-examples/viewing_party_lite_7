require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    attrs = {
      title: "Ant-Man and the Wasp: Quantumania",
      length: 120,
      rating: 85
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("Ant-Man and the Wasp: Quantumania")
  end
end