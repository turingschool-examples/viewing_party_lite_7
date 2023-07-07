class SearchFacade
  attr_reader :movie_by_id
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def details
    service = MovieService.new
    request = service.movie_by_id(@movie_id)
    @details = request
  end
end