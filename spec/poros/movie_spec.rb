require 'rails_helper'

RSpec.describe "Movie" do
  it "exists" do
    movie_data = {
      title: "The Big Lebowski",
      vote_average: 9.9
    }

    movie = Movie.new(movie_data)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("The Big Lebowski")
    expect(movie.rating).to eq(9.9)
  end

end