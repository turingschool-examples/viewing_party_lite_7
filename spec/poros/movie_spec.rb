require 'rails_helper'

RSpec.describe Movie do
  let(:movie_data) do
    {
      original_title: 'Test Movie',
      vote_average: 7.5,
      runtime: 120,
      genres: [{ name: 'Drama' }, { name: 'Action' }],
      overview: 'A test movie overview',
      id: 1
    }
  end

  let(:movie) { Movie.new(movie_data) }

  describe 'initialization' do
    it 'correctly initializes movie attributes' do
      expect(movie.title).to eq('Test Movie')
      expect(movie.vote_average).to eq(7.5)
      expect(movie.runtime).to eq(120)
      expect(movie.genres).to eq('Drama, Action')
      expect(movie.summary).to eq('A test movie overview')
      expect(movie.id).to eq(1)
      expect(movie.cast).to be_empty
      expect(movie.reviews).to be_empty
    end
  end

  describe 'formatted_runtime' do
    it 'returns a formatted runtime' do
      expect(movie.formatted_runtime).to eq('2 hours')
    end

    it 'handles zero minutes' do
      movie_with_zero_minutes = Movie.new(movie_data.merge(runtime: 120 - 30))
      expect(movie_with_zero_minutes.formatted_runtime).to eq('1 hours 30 minutes')
    end

    it 'handles zero hours' do
      movie_with_zero_hours = Movie.new(movie_data.merge(runtime: 30))
      expect(movie_with_zero_hours.formatted_runtime).to eq('30 minutes')
    end

    it 'handles zero hours and zero minutes' do
      movie_with_no_runtime = Movie.new(movie_data.merge(runtime: 0))
      expect(movie_with_no_runtime.formatted_runtime).to eq('0 minutes')
    end
  end

  describe 'parse_genres' do
    it 'correctly parses genres from an array of hashes' do
      genres = movie.parse_genres([{ name: 'Adventure' }, { name: 'Comedy' }])
      expect(genres).to eq('Adventure, Comedy')
    end

    it 'correctly parses genres from an array of strings' do
      genres = movie.parse_genres(['Action', 'Thriller'])
      expect(genres).to eq('Action, Thriller')
    end

    it 'handles nil genres' do
      genres = movie.parse_genres(nil)
      expect(genres).to eq('N/A')
    end
  end

  describe 'add_cast' do
    it 'adds a cast member to the movie' do
      actor = 'Test Actor'
      movie.add_cast(actor)
      expect(movie.cast).to include(actor)
    end
  end

  describe 'add_review' do
    it 'adds a review to the movie' do
      review = 'A great test review'
      movie.add_review(review)
      expect(movie.reviews).to include(review)
    end
  end

  describe "creates ojbect from API data" do
    it 'creates a movie from an API response' do

      expect(movie.title).to eq('Test Movie')
      expect(movie.vote_average).to eq(7.5)
      expect(movie.runtime).to eq(120)
      expect(movie.genres).to eq('Drama, Action')
      expect(movie.summary).to eq('A test movie overview')
      expect(movie.id).to eq(1)
    end
  end
end
