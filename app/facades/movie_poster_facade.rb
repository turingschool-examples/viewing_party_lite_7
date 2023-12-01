class MoviePosterFacade
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def movie_poster
    service = MovieService.new

    json = service.movie_poster(@movie_id)
    @movie_poster = MoviePoster.new(json)
  end
end