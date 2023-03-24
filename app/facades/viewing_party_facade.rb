class ViewingPartyFacade
  attr_reader :user

  def initialize(params, viewing_party = nil)
    @user = User.find(params[:user_id])
    @movie_id = params[:id]
    # @viewing_party = ViewingParty.find(params[:viewing_party_id]) if viewing_party.present?
  end

  def service
    MoviedbService.new
  end

  def movie
    json = service.movie(@movie_id)
    Movie.new(json)
  end
end