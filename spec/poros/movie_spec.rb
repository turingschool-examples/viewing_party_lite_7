require 'rails_helper'

RSpec.describe Movie do
  it 'initializes with a hash of data' do
    data = {
      id: 1,
      title: 'Elemental',
      vote_average: 4.7
    }

    movie = Movie.new(data)

    expect(movie.id).to eq(1)
    expect(movie.title).to eq('Elemental')
    expect(movie.vote_average).to eq(4.7)
  end
end