require 'rails_helper'
RSpec.describe Movie do
  before(:each) do
    @movie_data = {
      id: 5,
      original_title: 'Star Wars',
      vote_average: 8.6,
      runtime: 121,
      genres: [
        {
          'name': 'Space War'
        },
        {
          'name': 'Thriller'
        }
      ],
      overview: 'A movie about wars in the stars'
    }
    @movie = Movie.new(@movie_data)
  end
  describe 'initialize' do
    it 'creates a movie object' do
      expect(@movie).to be_a(Movie)
      expect(@movie.movie_id).to eq(5)
      expect(@movie.title).to eq('Star Wars')
      expect(@movie.average).to eq(8.6)
      expect(@movie.runtime).to eq(121)
      expect(@movie.summary).to eq('A movie about wars in the stars')
      expect(@movie.genres).to be_an(Array)
      expect(@movie.genres[0]).to be_a(Hash)
    end
  end

  describe '#convert_time' do
    it 'should convert the time to hours and minutes' do
      expect(@movie.convert_time).to eq('2h 1min')
    end
  end

  describe '#format_genre' do
    it 'should format the genre' do
      expect(@movie.format_genre).to eq('Space War, Thriller')
    end
  end
end
