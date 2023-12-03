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
        Poro::Movie.new(d)
      end

      results.append(movie)
    end

    results
  end

  # @param movie: a Poro::Movie object; lives outside the AR Model
  # @param movie_page: the json response from the details page
  # @return poro::movie with all details
  def self.add_details(movie, movie_page)
    movie.set_genres_and_runtime(movie_page)

    cast_reviews = TMDBService.get_cast_and_reviews_for_movie(movie.id)
    movie.set_cast_and_reviews(cast_reviews)

    movie
  end

  # @return poro::movie with all details
  def self.movie(id)
    movie = Rails.cache.read("movie_#{id}")

    if movie.nil? || movie.runtime.nil?  # nonexistent or incomplete movie
      movie_page = TMDBService.get_movie(id)

      if movie.nil?
        movie = Poro::Movie.new(movie_page)
      end

      add_details(movie, movie_page)
      Rails.cache.write("movie_#{id}", movie)
    end

    movie
  end
end
