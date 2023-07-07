class SearchFacade
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def details
    service = MovieService.new
    request = service.movie_by_id(@movie_id)
    @details = request
  end
end