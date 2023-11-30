class MovieDetailsFacade

  def initialize(movie_id)
    @movie_id = movie_id
  end
  
  def full_details
    service = MovieService.new
    details = service.movie_details(@movie_id)
    credits = service.get_credits(@movie_id)
    reviews = service.get_reviews(@movie_id)
    MovieDetails.new(details, credits, reviews)
  end
end