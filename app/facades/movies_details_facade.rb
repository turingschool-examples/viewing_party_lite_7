class MoviesDetailsFacade
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def details
    service = MoviesService.new
    details = service.movie_details(@movie_id)
    credits = service.get_credits(@movie_id)
    reviews = service.get_reviews(@movie_id)
    @movie_details = MovieDetails.new(details, credits, reviews)
  end
end