require 'rails_helper'

RSpec.describe Movie do
  it 'exists and has attributes' do
    data = {
            id: 1,
            title: 'Tremors',
            vote_average: 9.7,
            runtime: 160,
            genres: ['drama', 'thriller'],
            summary: 'A really really good movie',
            poster: 'https://movieposters.com/tremors'
          }

    movie = Movie.new(data)

    expect(movie).to be_a(Movie)
    expect(movie.id).to be_an(Integer)
    expect(movie.title).to be_a(String)
    expect(movie.vote_average).to be_a(Float)
    expect(movie.runtime).to be_a(Integer)
    expect(movie.genres).to be_a(Array)
    expect(movie.summary).to be_a(String)
    expect(movie.poster).to be_a(String)

    expect(movie.id).to eq(1)
    expect(movie.title).to eq('Tremors')
    expect(movie.vote_average).to eq(9.7)
    expect(movie.runtime).to eq(160)
    expect(movie.genres).to eq(['drama', 'thriller'])
    expect(movie.summary).to eq('A really really good movie')
    expect(movie.poster).to eq('https://movieposters.com/tremors')
  end
end