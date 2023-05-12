require 'rails_helper'

RSpec.describe Movie do
  before(:each) do
    test_movie
    @movie = Movie.new(@data)
  end
  describe "initialize" do
    it "exists and has attributes" do
      expect(@movie).to be_a Movie
      expect(@movie.title).to eq("Fight Club")
      expect(@movie.id).to eq(550)
      expect(@movie.vote_average).to eq(8.4)
      expect(@movie.runtime).to be nil
      expect(@movie.genres).to be nil
      expect(@movie.overview).to eq("A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.")
    end
  end
  describe "format_runtime" do
    it "turns minutes to hours and minutes" do
      test_movie_details
      movie_8 = Movie.new(@data)
      expect(movie_8.format_runtime).to eq("2 hours 19 minutes")
    end
  end
  describe "extract_genres" do
    it "extracts genre names from data" do
      data = [{ "id": 18, "name": "Drama" }, { "id": 53, "name": "Thriller" }, { "id": 35, "name": "Comedy" }]
      expect(@movie.extract_genres(data)).to eq(%w[Drama Thriller Comedy])
    end
  end
  describe "is_nil?" do
    it "checks if the given data is nil" do
      expect(@movie.is_nil?(nil)).to eq(nil)
      expect(@movie.is_nil?("data")).to eq("data")
    end
  end
end
