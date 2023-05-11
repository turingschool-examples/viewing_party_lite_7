require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    attrs = {
      id: 11381,
      title: "Tommy Boy",
      rating: 6.8,
      runtime: 98,
      genres: ['Comedy'],
      summary: "To save the family business, two ne’er-do-well traveling salesmen hit the road with disastrously funny consequences.",
      cast: ["Chris Farley", "David Spade", "Brian Dennehy", "Bo Derek", "Dan Aykroyd", "Julie Warner", "Sean McCann", "Zach Grenier", "James Blendick", "Paul Greenburg"],
      reviews: ["John Chard": "A fun comedy that is a little bit more than just a vehicle for Chris Farley and David Spade."]
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.id).to eq(11381)
    expect(movie.title).to eq("Tommy Boy")
    expect(movie.rating).to eq(6.8)
    expect(movie.runtime).to eq(98)
    expect(movie.genres).to eq(['Comedy'])
    expect(movie.summary).to eq("To save the family business, two ne’er-do-well traveling salesmen hit the road with disastrously funny consequences.")
    expect(movie.cast).to eq(["Chris Farley", "David Spade", "Brian Dennehy", "Bo Derek", "Dan Aykroyd", "Julie Warner", "Sean McCann", "Zach Grenier", "James Blendick", "Paul Greenburg"])
    expect(movie.reviews).to eq(["John Chard": "A fun comedy that is a little bit more than just a vehicle for Chris Farley and David Spade."])
  end
end