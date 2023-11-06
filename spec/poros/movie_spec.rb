# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  describe 'initialize' do
    let(:data) do
      {
        id: 1,
        title: 'Lock, Stock and Two Smoking Barrels',
        vote_average: 10,
        runtime: 100,
        genres: [{ name: 'Crime' }, { name: 'Comedy' }],
        description: 'Guy Ritchie film',
        poster_path: 'www.movie.com'
      }
    end

    it 'creates a movie object' do
      movie = Movie.new(data)

      expect(movie).to be_a(Movie)
      expect(movie.id).to eq(1)
      expect(movie.title).to eq('Lock, Stock and Two Smoking Barrels')
      expect(movie.vote_average).to eq(10)
      expect(movie.runtime).to eq(100)
      expect(movie.description).to eq('Guy Ritchie film')
      expect(movie.poster_path).to eq('www.movie.com')
    end
  end
end
