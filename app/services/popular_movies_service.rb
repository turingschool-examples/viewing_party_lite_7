require_relative "service_service"

class PopularMoviesService
  def popular_movies
    ServiceService.new.get_url("movie/popular")
   end
end