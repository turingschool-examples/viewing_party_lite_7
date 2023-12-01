require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    attrs = { 
      title: "Trolls Band Together",
      vote_average: 7.181,
      id: 901362
    }
    
    @movie = Movie.new(attrs)

    expect(@movie).to be_a Movie
    expect(@movie.title).to eq("Trolls Band Together")
    expect(@movie.vote_average).to eq(7.181)
  end
end