class MoviesFacade
  attr_reader :_cached_movies

  def initialize
    @_cached_movies = {}
  end

  def find_movie(id)
    @_cached_movies[id] ||= service.find_movie(id)
  end

  private

  def service
    MoviesService.new
  end
end
