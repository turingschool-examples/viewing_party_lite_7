require 'rails_helper'

RSpec.describe Movie do
  it "exists & has attributes" do
    attributes = {
      "id" => 55,
      "title" => "Interstellar",
      "vote_average" => 9.0
    }

    movie = Movie.new(attributes)

    expect(movie).to be_a(Movie)
    expect(movie.movie_id).to eq(55)
    expect(movie.title).to eq("Interstellar")
    expect(movie.vote_avg).to eq(9.0)
  end
end