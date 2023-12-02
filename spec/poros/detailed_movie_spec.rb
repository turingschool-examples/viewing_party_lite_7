require "rails_helper"

RSpec.describe DetailedMovie do
  before :each do
    attrs = { title: "Trolls Band Together",
      vote_average: 7.181,
      id: 901362,
      runtime: 92,
      overview: "When Branchs brother...", 
      genres: [
        {"id": 16, "name": "Animation"},
        { "id": 10751, "name": "Family"},
        { "id": 10402, "name": "Music"},
        {"id": 14, "name": "Fantasy"},
        {"id": 35, "name": "Comedy"}
      ]}

    @movie = DetailedMovie.new(attrs)
  end
  it "exists" do
    expect(@movie).to be_a DetailedMovie
    expect(@movie.title).to eq("Trolls Band Together")
    expect(@movie.vote_average).to eq(7.181)
    expect(@movie.id).to eq(901362)
    expect(@movie.runtime).to eq(92)
    expect(@movie.genres).to eq([
      {"id": 16, "name": "Animation"},
      { "id": 10751, "name": "Family"},
      { "id": 10402, "name": "Music"},
      {"id": 14, "name": "Fantasy"},
      {"id": 35, "name": "Comedy"}
    ])
    expect(@movie.summary).to eq("When Branchs brother...")
  end

  describe "#genres_as_list" do
    it "can find genres names as a list" do
      expect(@movie.genres_as_list).to eq(["Animation", "Family", "Music", "Fantasy", "Comedy"])
    end
  end

  describe "#runtime_in_hours_and_minutes" do
    it "can provide the runtime of a movie in this format" do
      expect(@movie.runtime_in_hours_and_minutes).to eq("1h 32min")
    end
  end
end