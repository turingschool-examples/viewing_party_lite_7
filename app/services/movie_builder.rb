require 'json'
require 'faraday'
require './app/services/movie_service.rb'
require './app/poros/movie.rb'


class MovieBuilder
  def self.service
    MovieService.new
  end

  def self.top_rated_movies
    response = service.get_top_rated_movies
    top_20_movies = response[:results]

    top_20_movies.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.search_movies(query)
    response = service.get_movie_search(query)
    search_results = response[:results]

    search_results.map do |movie_data|
      Movie.new(movie_data)
    end
  end
end