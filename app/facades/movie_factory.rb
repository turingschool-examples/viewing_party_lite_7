require './app/poros/movie.rb'
require 'faraday'

class MovieFactory
  def service 
    MovieService.new
  end

  def top_20_movies
    service.top_rated_movies.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def search_movies(query)
    service.search_movies(query).map do |movie_data|
      Movie.new(movie_data)
    end
  end
end