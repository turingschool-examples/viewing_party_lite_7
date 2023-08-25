class ViewingPartyFacade
  def initialize(params)
    @params = params
  end

  def service
    @_movie_service ||= MovieService.new
  end

  def movie
    json = service.movie_details(@params[:movie_id])
    Movie.new(json)
  end
end