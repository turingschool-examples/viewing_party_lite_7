# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    attrs = {
      title: 'The Godfather',
      vote_average: 8.7,
      runtime: 175,
      genres: [{ name: 'Crime' }, { name: 'Drama' }],
      overview: ['Stuff Happens'],
      id: 550
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq('The Godfather')
    expect(movie.vote_average).to eq(8.7)
    expect(movie.runtime).to eq(175)
    expect(movie.genres).to eq(%w[Crime Drama])
    expect(movie.summary).to eq(['Stuff Happens'])
    expect(movie.id).to eq(550)
  end
end
