require 'rails_helper'

RSpec.describe Movie do
  before(:each) do
    @data = {
      "adult": false,
      "backdrop_path": "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg",
      "genre_ids": [
          18,
          53,
          35
      ],
      "id": 550,
      "original_language": "en",
      "original_title": "Fight Club",
      "overview": "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
      "popularity": 56.3,
      "poster_path": "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
      "release_date": "1999-10-15",
      "title": "Fight Club",
      "video": false,
      "vote_average": 8.433,
      "vote_count": 26357
  }
  end
  it "exists and has attributes" do
    movie = Movie.new(@data)
    expect(movie).to be_a Movie
    expect(movie.title).to eq("Fight Club")
  end
end