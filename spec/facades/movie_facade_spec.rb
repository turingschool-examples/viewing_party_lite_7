require 'rails_helper'

RSpec.describe MovieFacade, :vcr do
  before(:all) do
    @movie_facade = MovieFacade.new
  end

  describe 'search' do
    it 'returns an array of movie objects' do
      movies = @movie_facade.search('King')

      expect(movies).to be_an(Array)
      expect(movies).to all(be_a(Movie))
    end
  end

  describe 'top_rated' do
    it 'returns an array of movie objects' do
      movies = @movie_facade.top_rated

      expect(movies).to be_an(Array)
      expect(movies).to all(be_a(Movie))
    end
  end

  describe 'find_movie' do
    it 'returns a movie object with all details' do
      movie = @movie_facade.find_movie(550)

      expect(movie).to be_a(MovieDetailed)
      expect(movie.id).to eq(550)
      expect(movie.title).to eq('Fight Club')
      expect(movie.vote_average).to eq(8.433)
      expect(movie.image).to eq('/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg')
      expect(movie.genre).to eq(["Drama", "Thriller", "Comedy"])
      expect(movie.runtime).to eq(139)
      expect(movie.summary).to eq("A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.")
    end
  end

  describe 'get_movies' do
    it 'returns top rated movies' do
      movies = @movie_facade.get_movies('top rated')
      movies2 = @movie_facade.top_rated

      expect(movies).to be_an(Array)
      expect(movies).to all(be_a(Movie))
      expect(movies.first.title).to eq(movies2.first.title)
      expect(movies.last.title).to eq(movies2.last.title)
    end

    it 'returns searched movies' do
      movies = @movie_facade.get_movies('princess')
      movies2 = @movie_facade.search('princess')

      expect(movies).to be_an(Array)
      expect(movies).to all(be_a(Movie))
      expect(movies.first.title).to eq(movies2.first.title)
      expect(movies.last.title).to eq(movies2.last.title)
    end
  end
end
