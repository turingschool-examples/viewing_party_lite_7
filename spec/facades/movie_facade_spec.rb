require 'rails_helper'

RSpec.describe MovieFacade do
  before(:each) do
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/top_rated_movies.json'))
    
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&query=the")
      .to_return(status: 200, body: File.read('./spec/fixtures/search_movie_the.json'))

    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&query=The%20fellowship%20of%20the%20ring")
      .to_return(status: 200, body: File.read('./spec/fixtures/search_movie.json'))

    stub_request(:get, "https://api.themoviedb.org/3/movie/5?api_key=#{ENV['MOVIE_API_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/four_rooms_info.json'))

    stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=#{ENV['MOVIE_API_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/fight_club_reviews.json'))

    stub_request(:get, "https://api.themoviedb.org/3/movie/5/credits?api_key=#{ENV['MOVIE_API_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/four_rooms_credits.json'))
  end

  describe 'class methods' do
    it "top_rated_movies" do
      movies = MovieFacade.top_rated_movies
      expect(movies).to be_an Array
      expect(movies.first).to be_a Movie
      expect(movies.count).to eq(20)
    end

    it "movie_search" do
      movies = MovieFacade.movie_search("the")
      expect(movies).to be_an Array
      expect(movies.first).to be_a Movie
      expect(movies.count).to eq(20)

      movies_2 = MovieFacade.movie_search("The fellowship of the ring")
      expect(movies_2).to be_an Array
      expect(movies_2.first).to be_a Movie
      expect(movies_2.count).to eq(6)
    end

    it "find_by_id" do
      movie_hash = MovieFacade.find_by_id(5)

      expect(movie_hash).to be_a Hash
      expect(movie_hash).to have_key :title
      expect(movie_hash).to have_key :vote_average
      expect(movie_hash).to have_key :runtime
    end

    it 'movie_details' do
      movie = MovieFacade.movie_details(5)

      expect(movie).to be_a Movie
      expect(movie.title).to eq("Four Rooms")
    end

    it 'reviews' do
      reviews = MovieFacade.reviews(550)

      expect(reviews).to be_an Array
      expect(reviews.first).to be_a Review
      expect(reviews.count).to eq(8)
    end

    it 'cast' do
      cast = MovieFacade.cast(5)

      expect(cast).to be_an Array
      expect(cast.first).to be_a Cast
      expect(cast.count).to eq(10)
    end
  end
end