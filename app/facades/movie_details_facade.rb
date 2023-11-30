class MovieDetailsFacade
  attr_reader :movie_details

  def initialize(movie_id)
    @movie_id = movie_id
    @movie_details = details
  end
  
  def details
    service = MovieService.new
    details = service.movie_details(@movie_id)
    MoviesDetails.new(details)
  end
end