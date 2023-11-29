require_relative "../services/tmdb_service"
require_relative "../poros/movie"

class MovieFactory
  def self.get_top_rated
    data = TMDBService.top_rated
    movies = []

    data.each do |d|
      movies.append(Movie.new(d))
    end

    movies
  end

  def self.add_details(movie)
    details = TMDBService.get_movie(movie.id)
    movie.set_genres_and_duration(details)
  end
end
