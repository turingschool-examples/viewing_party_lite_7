require "httparty"

class MovieDbService
  include HTTParty
  BASE_URL = 'https://www.themoviedb.org/'
  API_KEY = '<9076c0dc7c9df9e9b7fe792a574c94d4>'

  def initialize
    @options = { query: { api_key: API_KEY } }
  end

  def movie_details(movie_id)
    response = self.class.get("#{BASE_URL}/movie/#{movie_id}", @options)
    response.parsed_response
  end

  def movie_cast(movie_id)
    response = self.class.get("#{BASE_URL}/movie/#{movie_id}/credits", @options)
    response.parsed_response["cast"].first(10)
  end

  def movie_reviews(movie_id)
    response = self.class.get("#{BASE_URL}/movie/#{movie_id}/reviews", @options)
    response.parsed_respons
  end

