require "rails_helper"

RSpec.describe Movie do
  before(:each) do
    data = {
      id: 1,
      title: "Newest Movie",
      vote_average: 9.1,
      genres: [
        {
          "id": 18,
          "name": "Drama"
        },
        {
          "id": 80,
          "name": "Crime"
        }
      ],
      overview: "a tale of a lame movie",
      runtime: 189,
      poster_path: "/movie/image.jpg"
    }

    @movie = Movie.new(data)
  end

  it "exists and has attributes" do
    expect(@movie).to be_a(Movie)
    expect(@movie.id).to be_an(Integer)
    expect(@movie.id).to eq(1)
    expect(@movie.title).to be_a(String)
    expect(@movie.title).to eq("Newest Movie")
    expect(@movie.vote_average).to be_an(Float)
    expect(@movie.vote_average).to eq(9.1)
    expect(@movie.genres).to be_an(Array)
    expect(@movie.overview).to be_a(String)
    expect(@movie.overview).to eq("a tale of a lame movie")
    expect(@movie.runtime).to be_a(String)
    expect(@movie.runtime).to eq("3hr 9min")
    expect(@movie.poster_path).to be_a(String)
    expect(@movie.poster_path).to eq("/movie/image.jpg")
  end

  it "shows movie formatted" do
    expect(format_runtime(@movie.runtime)).to eq("3hr 9min")
  end
end
