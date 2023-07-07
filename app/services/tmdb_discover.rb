class TmdbDiscover

  def top_rated_list
    TopRated.new(service.top_movies_url)
  end

  def service
    TmdbService.new
  end
end