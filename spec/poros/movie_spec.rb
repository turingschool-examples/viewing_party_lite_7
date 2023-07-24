require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    data = {
      :id=>5555,
      :title=>"Ace Ventura",
      :vote_average=>10,
      :runtime=>120,
      :genres=>[
        {
            "id": 10751,
            "name": "Family"
        },
        {
            "id": 35,
            "name": "Comedy"
        }
    ],
    :overview=>"Ace Ventura is a pet detective",
    }

    movie = Movie.new(data)

    expect(movie).to be_a Movie
    expect(movie.id).to eq(5555)
    expect(movie.title).to eq("Ace Ventura")
    expect(movie.vote_average).to eq(10)
    expect(movie.genres).to eq([
      {
          "id": 10751,
          "name": "Family"
      },
      {
          "id": 35,
          "name": "Comedy"
      }
  ])
    expect(movie.overview).to eq("Ace Ventura is a pet detective")
  end
end