class TmdbDetails

  def movie_details(movie_id)
    Details.new(service.details_url(movie_id))
  end 

  def service
    TmdbService.new
  end
end