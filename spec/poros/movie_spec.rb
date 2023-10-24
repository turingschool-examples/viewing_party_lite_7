# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  before(:each) do
    @movie_data = {
      id: 1,
      title: 'Forrest Gump',
      vote_average: 8.2,
      runtime: 142,
      genres: [
        {
          "id": 35,
          "name": 'Comedy'
        },
        {
          "id": 12,
          "name": 'Adventure'
        },
        {
          "id": 14,
          "name": 'Fantasy'
        }
      ],
      overview: 'A movie about a guy named Forrest Gump'
    }

    @movie = Movie.new(@movie_data)
  end
  describe 'initialize' do
    it 'creates a movie object' do
      expect(@movie).to be_a(Movie)
      expect(@movie.id).to eq(1)
      expect(@movie.title).to eq('Forrest Gump')
      expect(@movie.vote_average).to eq(8.2)
      expect(@movie.runtime).to eq(142)
      expect(@movie.genres).to be_a(Array)
      expect(@movie.genres[0]).to be_a(Hash)
    end
  end

  describe '#convert_time' do
    it 'returns time converted into hours and mins' do
      expect(@movie.convert_time).to eq('2h 22min')
    end

    it 'returns time in mins if less than an hour' do
      movie_data = {
        id: 1,
        title: 'Forrest Gump',
        vote_average: 8.2,
        runtime: 52,
        genres: [
          {
            "id": 35,
            "name": 'Comedy'
          },
          {
            "id": 12,
            "name": 'Adventure'
          },
          {
            "id": 14,
            "name": 'Fantasy'
          }
        ],
        overview: 'A movie about a guy named Forrest Gump'
      }

      movie = Movie.new(movie_data)

      expect(movie.convert_time).to eq('52min')
    end
  end

  describe '#format_genres' do
    it 'formats genres into one string with commas seperating them' do
      expect(@movie.format_genres).to eq('Comedy, Adventure, Fantasy')
    end
  end
end
