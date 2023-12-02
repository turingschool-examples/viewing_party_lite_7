require_relative "../services/tmdb_service"
require_relative "../poros/movie"

class MovieFacade
  def self.get_top_rated
    data = TMDBService.top_rated

    make_movies(data)
  end

  def self.movie_search(query)
    data = TMDBService.search_movies(query)

    make_movies(data)
  end

  def self.make_movies(data)
    results = []

    data.each do |d|
      movie = Rails.cache.fetch("movie_#{d[:id]}") do
        m = Poro::Movie.new(d)
        add_details(m)
      end

      results.append(movie)
    end

    results
  end

  # @param movie: a Poro::Movie object; lives outside the AR Model
  # @return poro::movie with all details
  def self.add_details(movie)
    details = TMDBService.get_movie(movie.id)
    movie.set_genres_and_runtime(details)

    cast_reviews = TMDBService.get_cast_and_reviews_for_movie(movie.id)
    movie.set_cast_and_reviews(cast_reviews)

    movie
  end

  # @return poro::movie with all details
  def self.movie(id)
    # require "byebug"; byebug
    Rails.cache.fetch("movie_#{id}") do
      m = Poro::Movie.new(TMDBService.get_movie(id))
      add_details(m)
    end
  end
end
