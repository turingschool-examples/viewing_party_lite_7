require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    VCR.insert_cassette("user_submits_valid_movie_name")
    attrs = {
      title: "Up",
      vote_average: "8",
      genres: "Fun",
      overview: "Going up",
      runtime: "2"
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("Up")
    expect(movie.vote_average).to eq("8")
    expect(movie.genres).to eq("Fun")
    expect(movie.overview).to eq("Going up")
    expect(movie.runtime).to eq("2")
  end
end