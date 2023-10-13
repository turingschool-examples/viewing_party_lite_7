class MoviesDetailsFacade
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def details
    service = MoviesService.new
    details_response = service.movie_details(@movie_id)
    cast_response = service.get_cast(@movie_id)
    reviews_response = service.get_reviews(@movie_id)
    @details = MovieDetails.new(details_response, cast_response, reviews_response)
  end
end