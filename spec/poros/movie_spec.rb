# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    attrs = {
      title: 'Addams Family',
      runtime: 123,
      vote_average: 8.709,
      overview: 'Wholesome story about a family',
      genres: [{ "id": 18, "name": 'Drama' }, { "id": 80, "name": 'Crime' }],
      poster_path: '/zqV8MGXfpLZiFVObLxpAI7wWonJ.jpg'
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.title).to eq('Addams Family')
    expect(movie.runtime).to eq(123)
    expect(movie.vote_average).to eq(8.7)
    expect(movie.summary).to eq('Wholesome story about a family')
    expect(movie.genres).to eq('Drama, Crime')
    expect(movie.image_url).to eq('https://image.tmdb.org/t/p/w92/zqV8MGXfpLZiFVObLxpAI7wWonJ.jpg')
  end
end
