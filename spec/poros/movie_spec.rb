require "rails_helper"
require_relative "../../app/poros/movie"

RSpec.describe Poro::Movie do
  before(:each) do
    @attrs = {
      title: Faker::Movie.title,
      id: "1",
      vote_average: Faker::Number.between(from: 0.1, to: 10.0),
      overview: Faker::Lorem.paragraph,
      poster_path: "/alkdsjfh23r4t.svg"
    }

    @movie = Poro::Movie.new(@attrs)
  end

  it "exists" do
    expect(@movie.id).to eq @attrs[:id]
    expect(@movie).to be_a Poro::Movie
    expect(@movie.title).to eq(@attrs[:title])
    expect(@movie.vote_average).to eq(@attrs[:vote_average])
    expect(@movie.overview).to eq(@attrs[:overview])
    expect(@movie.poster_path).to eq(@attrs[:poster_path])
  end

  describe "#set_genres_and_runtime" do
    it "adds genre and duration details" do
      attr = {
        genres: [
          {name: "Crime"},
          {name: "Drama"}
        ],
        runtime: 175
      }

      @movie.set_genres_and_runtime(attr)
      expect(@movie.runtime).to eq 175
      expect(@movie.genres).to eq %w[Crime Drama]
    end
  end

  describe "#set_cast_and_reviews" do
    it "sets cast and reviews" do
      attr = {
        cast: [
          {name: "Marlin Brando"}
        ],
        reviews: [
          {name: "TP", review: "Good movie"}
        ]
      }

      @movie.set_cast_and_reviews(attr)
      expect(@movie.cast).to be_an Array
      expect(@movie.reviews).to be_an Array
    end
  end
end
