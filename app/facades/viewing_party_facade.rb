class ViewingPartyFacade
  attr_reader :movie, :guests
  
  def initialize(movie_id, user_id)
    @movie = create_movie(movie_id)
    @guests = User.all_excluding_id(user_id)
  end

  def create_movie(movie_id)
    response = MoviesService.new.movie_details(movie_id)
    Movie.new(response)
  end
end