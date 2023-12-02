require_relative "service_service"

class MovieCastService
  def movie_cast(id)
    ServiceService.new.get_url("movie/#{id}/credits")   
  end
end