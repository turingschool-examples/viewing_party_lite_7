class CastFacade
  def get_cast(movie_id)
    results = service.get_cast(movie_id)[:cast][0..9]

    results.map do |result|
      Cast.new(result)
    end
  end

  private

  def service
    @_service ||= TmdbService.new
  end
end
