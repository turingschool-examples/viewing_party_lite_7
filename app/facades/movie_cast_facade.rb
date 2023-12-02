class MovieCastFacade
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def movie_cast
    service = MovieCastService.new

    json = service.movie_cast(@movie_id)
    actors = json[:cast].map do |actor_data|
      MovieActor.new(actor_data)
    end
    @actors = actors.first(10)
  end
end