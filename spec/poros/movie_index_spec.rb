# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieIndex do
  it 'exists' do
    attrs = {
      title: 'Addams Family',
      vote_average: 8.709,
      id: 268
    }

    movie = MovieIndex.new(attrs)

    expect(movie).to be_a MovieIndex
    expect(movie.title).to eq('Addams Family')
    expect(movie.vote_average).to eq(8.7)
    expect(movie.id).to eq(268)
  end
end
