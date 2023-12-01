class MovieCastFacade
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def movie_cast
    service = MovieService.new

    json = service.movie_cast(@movie_id)
    @movie_cast = DetailedMovie.new(json)
  end
end