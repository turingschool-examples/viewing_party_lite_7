require_relative "service_service"

class MovieReviewService
  def movie_reviews(movie_id)
    ServiceService.new.get_url("movie/#{movie_id}/reviews")  
  end
end