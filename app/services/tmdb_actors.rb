class TmdbActors

  def movie_actors(movie_id)
    Actors.new(service.cast_url(movie_id))
  end 

  def service
    TmdbService.new
  end
end