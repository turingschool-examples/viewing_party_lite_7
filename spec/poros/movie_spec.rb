# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    attrs = {
      title: 'Interstellar',
      vote_average: 9.5,
      overview: 'Blahblah',
      poster_path: 'whatever.jpg'
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.title).to eq('Interstellar')
    expect(movie.vote_average).to eq(9.5)
    expect(movie.overview).to eq('Blahblah')
    expect(movie.poster_path).to eq('whatever.jpg')
  end
end
