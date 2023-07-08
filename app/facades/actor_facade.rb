class ActorFacade
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def details
    service = MovieService.new
    request = service.movie_cast(@movie_id)
    @actors = request[:cast].map do |actor_data|
      Actor.new(actor_data)
    end
  end
end