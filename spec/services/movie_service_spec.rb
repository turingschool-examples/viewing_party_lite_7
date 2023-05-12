require 'rails_helper'

RSpec.describe MovieService do
  before(:each) do
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/top_rated_movies.json'))
    
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&query=The")
      .to_return(status: 200, body: File.read('./spec/fixtures/search_movie_the.json'))

    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&query=The%20Fellowship%20of%20the%20ring")
      .to_return(status: 200, body: File.read('./spec/fixtures/search_movie.json'))

    stub_request(:get, "https://api.themoviedb.org/3/movie/5?api_key=#{ENV['MOVIE_API_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/four_rooms_info.json'))

    stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=#{ENV['MOVIE_API_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/fight_club_reviews.json'))

    stub_request(:get, "https://api.themoviedb.org/3/movie/5/credits?api_key=#{ENV['MOVIE_API_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/four_rooms_credits.json'))
  end

  describe 'class methods' do
    it 'top_rated_movies' do
      @response = MovieService.top_rated_movies
      @movies = @response[:results]

      expect(@movies).to be_a(Array)
      expect(@movies.count).to eq(20)
      expect(@movies.first[:title]).to eq("The Godfather")
    end

    it 'movie_search' do
      @response = MovieService.movie_search("The Fellowship of the ring")
      @movies = @response[:results]

      expect(@movies).to be_a(Array)
      expect(@movies.first[:title]).to eq("The Lord of the Rings: The Fellowship of the Ring")

      @response2 = MovieService.movie_search("The")
      @movies2 = @response2[:results]
      
      expect(@movies2.count).to eq(20)
    end

    it 'cast' do
      @response = MovieService.cast(5)
      @cast = @response[:cast]

      expect(@cast).to be_a(Array)
      expect(@cast.count).to eq(25)
    end

    it 'reviews' do
      @response = MovieService.reviews(550)
      @reviews = @response[:results]

      expect(@reviews).to be_a(Array)
      expect(@reviews.count).to eq(8)
    end

    it 'find_by_id' do
      @response = MovieService.find_by_id(5)
      
      expect(@response).to be_a(Hash)
      expect(@response[:title]).to eq("Four Rooms")
    end
  end
end