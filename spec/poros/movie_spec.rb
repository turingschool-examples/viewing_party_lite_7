require "rails_helper"

RSpec.describe Movie do
  before(:all) do
    data = {
      id: 1,
      title: "Frozen",
      vote_average: 4.765,
      runtime: 55,
      genres: "drama",
      overview: "movie about ice and things"
    }

    @movie = Movie.new(data)
  end

  describe "initialize" do
    it "exists" do
      expect(@movie).to be_a Movie
    end

    it "initializes with attributes" do
      expect(@movie.id).to eq(1)
      expect(@movie.title).to eq("Frozen")
      expect(@movie.rating).to eq(4.8)
      expect(@movie.runtime).to eq(55)
      expect(@movie.genres).to eq("drama")
      expect(@movie.summary).to eq("movie about ice and things")
    end
  end
end
