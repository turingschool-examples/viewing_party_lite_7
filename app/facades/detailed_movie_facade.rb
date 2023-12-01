class DetailedMovieFacade
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def detailed_movie
    service = MovieService.new

    json = service.detailed_movie(@movie_id)
    @detailed_movie = DetailedMovie.new(json)
  end
end