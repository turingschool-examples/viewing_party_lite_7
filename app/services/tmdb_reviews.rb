class TmdbReviews

  def movie_reviews(movie_id)
    Reviews.new(service.reviews_url(movie_id))
  end 

  def service
    TmdbService.new
  end
end