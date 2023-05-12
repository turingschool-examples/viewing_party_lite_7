require './app/poros/movie'
require './app/poros/movie_data'

class MovieFacade
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def movie_details(movie_id)
    MovieData.new(type: 'details',
              data: Movie.new(service.full_movie_details(movie_id)),
              user: user)
  end

  def top_20_movies()
    MovieData.new(type: 'top rated',
              data: movies(service.top_rated_movies),
              user: user)
  end

  def search_movies(query)
    MovieData.new(type: 'search',
              data: movies(service.search_movies(query)),
              user: user,
              query: query)
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
