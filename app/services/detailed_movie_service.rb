require_relative "service_service"

class DetailedMovieService
  def detailed_movie(movie_id)
    ServiceService.new.get_url("movie/#{movie_id}")   
  end
end