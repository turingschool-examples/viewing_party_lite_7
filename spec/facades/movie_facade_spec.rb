require 'rails_helper'

RSpec.describe MovieFacade do
  before :each do
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{Rails.application.credentials.api_key}&query=Star%20Wars").
      to_return(status: 200, body: File.read("spec/features/fixtures/search_movie_results.json"), headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{Rails.application.credentials.api_key}").
      to_return(status: 200, body: File.read("spec/features/fixtures/movie_results.json"), headers: {})  
      
    stub_request(:get, "https://api.themoviedb.org/3/movie/123?api_key=#{Rails.application.credentials.api_key}&movie_id=123").
    to_return(status: 200, body: File.read("spec/features/fixtures/movie_details.json"), headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/123/credits?api_key=#{Rails.application.credentials.api_key}&movie_id=123").
      to_return(status: 200, body: File.read("spec/features/fixtures/movie_cast.json"), headers: {})
    
    stub_request(:get, "https://api.themoviedb.org/3/movie/123/reviews?api_key=#{Rails.application.credentials.api_key}&movie_id=123").
      to_return(status: 200, body: File.read("spec/features/fixtures/reviews.json"), headers: {})
  end

  describe 'initialize' do
    it 'exists' do
      movie_id = 123
      movie_facade = MovieFacade.new(movie_id)
      expect(MovieFacade).to be_a(Class)
      expect(movie_facade.movie_id).to eq(movie_id)
      expect(movie_facade.url).to eq('https://api.themoviedb.org')
    end
  end
  
  describe '.top_rated_movies' do
    it 'returns an array of top-rated movies' do
      movies = MovieFacade.top_rated_movies
      expect(movies).to be_an(Array)
      expect(movies).not_to be_empty
      expect(movies.first).to be_a(Movie)
      expect(movies.all? { |movie| movie.is_a?(Movie)}).to be_truthy
    end
  end

  describe '.search' do
    it 'returns an array of movies matching the search query' do
      query = 'Star Wars' 
      movies = MovieFacade.search(query)
      expect(movies).to be_an(Array)
      expect(movies).not_to be_empty
      expect(movies.first).to be_a(Movie)
    end
  end

  describe '.find_by_id' do
    it 'returns a movie by its ID' do
      movie_id = 123 
      movie = MovieFacade.find_by_id(movie_id)
      expect(movie).to be_a(Movie)
    end
  end

  describe '.find_cast' do
    it 'returns an array of cast members for a movie by its ID' do
      movie_id = 123 
      cast = MovieFacade.find_cast(movie_id)
      expect(cast).to be_an(Array)
      expect(cast.first).to be_a(CastMember)
    end
  end

  describe '.find_reviews' do
    it 'returns an array of reviews for a movie by its ID' do
      movie_id = 123 
      reviews = MovieFacade.find_reviews(movie_id)
      expect(reviews).to be_an(Array)
      expect(reviews.first).to be_a(Review)
    end
  end
end
