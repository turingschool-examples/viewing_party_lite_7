require "rails_helper"

RSpec.describe Movie do
  before(:each) do
    @spinal_tap = {
      title: "Spinal Tap",
      runtime: 100,
      genres: [
        {"id": 18, "name": "Drama"},
        {"id": 53, "name": "Thriller"},
        {"id": 35, "name": "Comedy"}
      ],
      overview: "A mockumentary about a fictional British heavy metal band.",
      vote_average: 8.7,
      poster_path: "/9E2y5Q7WlCVNEhP5GiVTjhEhx1o.jpg"
    }

    @movie = Movie.new(@spinal_tap)
  end

  it "exists" do
    expect(@movie).to be_a(Movie)
    expect(@movie.title).to eq("Spinal Tap")
    expect(@movie.runtime).to eq(100)
    expect(@movie.genres).to eq([{:id=>18, :name=>"Drama"}, {:id=>53, :name=>"Thriller"}, {:id=>35, :name=>"Comedy"}])
    expect(@movie.overview).to eq("A mockumentary about a fictional British heavy metal band.")
    expect(@movie.vote_average).to eq(8.7)
    expect(@movie.poster_path).to eq("/9E2y5Q7WlCVNEhP5GiVTjhEhx1o.jpg")
  end
end