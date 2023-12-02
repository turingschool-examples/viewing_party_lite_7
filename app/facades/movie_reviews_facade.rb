class MovieReviewsFacade
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def movie_reviews
    service = MovieReviewService.new

    json = service.movie_reviews(@movie_id)

    @review_data = json[:results].map do |review_data|
      MovieReview.new(review_data)
    end
  end
end