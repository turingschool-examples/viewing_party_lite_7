require './app/poros/movie'

class MovieFacade
  def movies(movies_data)
    @_movies ||= movies_data.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def top_20_movies
    movies(service.top_rated_movies)
  end

  def search_movies(query)
    movies(service.search_movies(query))
  end

  private

  def service
    @_service ||= MovieService.new
  end
end
