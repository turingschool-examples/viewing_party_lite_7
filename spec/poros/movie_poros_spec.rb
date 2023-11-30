require "rails_helper"

RSpec.describe MoviePoro do
  it "exists" do
    attrs = {
      id: 1,
      title: "test",
      vote_average: 2,
      runtime: 3,
      genres: "gen",
      overview: "simple",
      cast: "alot",
      results: "good",
      poster_path: "somewhere"
    }

    mp = MoviePoro.new(attrs)

    expect(mp).to be_a MoviePoro
    expect(mp.id).to eq(1)
    expect(mp.title).to eq("test")
    expect(mp.vote_average).to eq(2)
    expect(mp.runtime).to eq(3)
    expect(mp.genres).to eq("gen")
    expect(mp.overview).to eq("simple")
    expect(mp.cast).to eq("alot")
    expect(mp.results).to eq("good")
    expect(mp.poster_path).to eq("somewhere")
  end
end