require './app/poros/movie'
require './app/poros/user_movies'

class MovieFacade
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def movie_details(movie_id)
    UserMovies.new(type: 'details',
                   movies: Movie.new(service.full_movie_details(movie_id)),
                   user:)
  end

  def viewing_parties(movie_ids)
    movies_data = service.movies_by_ids(movie_ids).map do |movie_data|
      Movie.new(movie_data)
    end

    UserMovies.new(type: 'viewing parties',
                   movies: movies_data,
                   user:)
  end

  def top_20_movies
    UserMovies.new(type: 'top rated',
                   movies: movies(service.top_rated_movies),
                   user:)
  end

  def search_movies(query)
    UserMovies.new(type: 'search',
                   movies: movies(service.search_movies(query)),
                   user:,
                   query:)
  end

  private

  def movies(movies_data)
    @_movies ||= movies_data.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def service
    @_service ||= MovieService.new
  end
end
