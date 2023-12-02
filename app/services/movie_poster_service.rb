require_relative "service_service"

class MoviePosterService
  def movie_poster(movie_id)
    ServiceService.new.get_url("movie/#{movie_id}/images")
  end
end