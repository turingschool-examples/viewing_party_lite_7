class MovieFacade
  attr_reader :user,
              :movie_id

  def initialize(params)
    @user = User.find(params[:user_id])
    @movie_id = params[:id]
  end

  def service
    MoviedbService.new
  end

  def movie
    json = service.movie(@movie_id)
    Movie.new(json)
  end
end