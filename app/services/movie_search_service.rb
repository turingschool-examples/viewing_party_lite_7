require_relative "service_service"

class MovieSearchService
  def search_movies(search_params)
    ServiceService.new.get_url("search/movie?query=#{search_params}")
  end
end