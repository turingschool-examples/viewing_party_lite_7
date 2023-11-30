require_relative "../services/tmdb_service"
require_relative "../poros/movie"

class MovieFacade
  @@top_rated = []
  @@movie_cache = []
  def self.get_top_rated
    return @@top_rated unless @@top_rated.length == 0

    data = TMDBService.top_rated

    data.each do |d|
      movie = Movie.new(d)
      @@movie_cache.append(movie)
      @@top_rated.append(movie)
    end

    @@top_rated
  end

  def self.add_details(movie)
    details = TMDBService.get_movie(movie.id)
    movie.set_genres_and_runtime(details)
  end
end
