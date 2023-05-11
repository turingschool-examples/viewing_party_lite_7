require 'rails_helper'

RSpec.describe MovieDetailed do
  describe 'initialize' do
    it 'exists and has attributes' do
      data = { "genres": [{ "id": 18,
                            "name": 'Drama' },
                          { "id": 53,
                            "name": 'Thriller' },
                          { "id": 35,
                            "name": 'Comedy' }],
               "id": 550,
               "overview": 'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.',
               "poster_path": '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
               "runtime": 139,
               "title": 'Fight Club',
               "vote_average": 8.433 }

      movie = MovieDetailed.new(data)

      expect(movie).to be_a(MovieDetailed)
      expect(movie.id).to eq(data[:id])
      expect(movie.title).to eq(data[:title])
      expect(movie.vote_average).to eq(data[:vote_average])
      expect(movie.image).to eq(data[:poster_path])
      expect(movie.genre).to eq(["Drama", "Thriller", "Comedy"])
      expect(movie.runtime).to eq(data[:runtime])
      expect(movie.summary).to eq(data[:overview])
    end

    it 'can create another object' do
      data = { "genres": [{ "id": 18,
                            "name": 'Thriller' }],
               "id": 1,
               "overview": 'This is a movie about a guy who does stuff.',
               "poster_path": '/thisismadeup.jpg',
               "runtime": 10,
               "title": 'Guy who does stuff',
               "vote_average": 0.001 }

      movie = MovieDetailed.new(data)

      expect(movie).to be_a(MovieDetailed)
      expect(movie.id).to eq(data[:id])
      expect(movie.title).to eq(data[:title])
      expect(movie.vote_average).to eq(data[:vote_average])
      expect(movie.image).to eq(data[:poster_path])
      expect(movie.genre).to eq(["Thriller"])
      expect(movie.runtime).to eq(data[:runtime])
      expect(movie.summary).to eq(data[:overview])
    end
  end
end
