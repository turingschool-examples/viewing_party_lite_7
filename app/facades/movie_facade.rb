require_relative "../services/tmdb_service"
require_relative "../poros/movie"

class MovieFacade
  @@top_rated = []
  @@movie_cache = []

  def self.get_top_rated
    return @@top_rated unless @@top_rated.length == 0
    # require "pry"; binding.pry
    data = TMDBService.top_rated

    data.each do |d|
      movie = Poro::Movie.new(d)
      @@top_rated.append(movie)
    end

    @@top_rated
  end

  def self.movie_search(query)
    data = TMDBService.search_movies(query)

    results = []

    data.each do |d|
      # require "pry"; binding.pry
      movie = @@movie_cache.find { |movie| movie.id == d[:id] }  # find it if it's there

      if movie.nil?  # if it's not, create the new object
        movie = Poro::Movie.new(d)
        @@movie_cache.append(movie)
      end

      results.append(movie)
    end

    results
  end

  def self.add_details(movie)
    details = TMDBService.get_movie(movie.id)
    movie.set_genres_and_runtime(details)
    cast_reviews = TMDBService.get_cast_and_reviews_for_movie(movie.id)
    movie.set_cast_and_reviews(cast_reviews)
  end

  def self.top_rated
    @@top_rated
  end
end
