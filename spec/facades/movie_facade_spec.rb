require 'rails_helper'

RSpec.describe MovieFacade, :vcr do
  before(:all) do
    @movie_facade = MovieFacade.new(550)
  end

  describe 'initialize' do
    it 'exists' do
      expect(@movie_facade).to be_a(MovieFacade)
    end
  end

  describe 'find_movie' do
    it 'returns a movie object with all details' do
      movie = @movie_facade.find_movie

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

  describe 'cast' do
    it 'returns an array of 10 cast members' do
      cast = @movie_facade.cast

      expect(cast).to be_an(Array)
      expect(cast).to all(be_a(Cast))
      expect(cast.count).to eq(10)
    end
  end

  describe 'reviews' do
    it 'returns all reviews for a movie' do
      reviews = @movie_facade.reviews

      expect(reviews).to be_an(Array)
      expect(reviews).to all(be_a(Review))
      expect(reviews.count).to eq(8)
    end
  end

  describe 'movie_title' do
    it 'returns the movie title' do
      expect(@movie_facade.movie_title).to eq('Fight Club')
    end
  end

  describe 'movie_vote_average' do
    it 'returns the movie vote average' do
      expect(@movie_facade.movie_vote_average).to eq(8.4)
    end
  end

  describe 'movie_runtime' do
    it 'returns the movie runtime' do
      expect(@movie_facade.movie_runtime).to eq(139)
    end
  end

  describe 'movie_genres' do
    it 'returns the movie genres' do
      expect(@movie_facade.movie_genres).to eq('Drama, Thriller, Comedy')
    end
  end
  
  describe 'movie_summary' do
    it 'returns the movie summary' do
      expect(@movie_facade.movie_summary).to eq("A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.")
    end
  end

  describe 'review_count' do
    it 'returns the count of reviews for a movie' do
      expect(@movie_facade.review_count).to eq(8)
    end
  end
end
