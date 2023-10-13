require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    VCR.insert_cassette("user_submits_valid_movie_name")
    attrs = {
      id: "1",
      title: "Up",
      vote_average: "8",
      genres: "[1]",
      overview: "Going up"
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.id).to eq("1")
    expect(movie.title).to eq("Up")
    expect(movie.vote_average).to eq("8")
    expect(movie.genres).to eq("[1]")
    expect(movie.overview).to eq("Going up")
  end
end