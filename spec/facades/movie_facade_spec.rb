require 'rails_helper'

RSpec.describe MovieFacade, :vcr do
  describe 'search' do
    it 'returns an array of movie objects' do
      movie_facade = MovieFacade.new
      movies = movie_facade.search('King')
      expect(movies).to be_an(Array)
    end
  end

  describe "top_rated" do
    it "creates top rated movies" do
      movie_facade = MovieFacade.new
      movies = movie_facade.top_rated

      expect(movies).to be_an(Array)
      expect(movies.first).to be_a(Movie)
    end
  end

  describe "find_movie" do
    it "creates a movie object" do
      movie_facade = MovieFacade.new
      movie = movie_facade.find_movie(11)

      expect(movie).to be_a(Movie)
    end
  end

  describe "reviews" do
    it "creates review objects" do
      movie_facade = MovieFacade.new
      reviews = movie_facade.reviews(11)

      expect(reviews).to be_an(Array)
    end
  end

  describe "cast" do
    it "creates cast objects" do
      movie_facade = MovieFacade.new
      cast = movie_facade.cast(11)
      
      expect(cast).to be_an(Array)
    end
  end
end