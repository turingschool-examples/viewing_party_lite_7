class MovieReviewsFacade
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def details
    service = MovieService.new
    request = service.search_reviews_by_movie(@movie_id)
    @reviews = request[:results].map do |review_data|
      Review.new(review_data)
    end
  end
end