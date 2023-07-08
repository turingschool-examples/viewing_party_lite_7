class ReviewFacade
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def show_reviews
    service = MovieService.new
    reviews_data = service.movie_reviews(@movie_id)
    @reviews = Review.new(reviews_data)
  end
end
