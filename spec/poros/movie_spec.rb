require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    data = {id: 1, title: 'Tremors', vote_average: 9.7}
    movie = Movie.new(data)

    expect(movie).to be_a(Movie)
    expect(movie.id).to be_an(Integer)
    expect(movie.title).to be_a(String)
    expect(movie.vote_average).to be_a(Float)

    expect(movie.id).to eq(1)
    expect(movie.title).to eq('Tremors')
    expect(movie.vote_average).to eq(9.7)

  end
end