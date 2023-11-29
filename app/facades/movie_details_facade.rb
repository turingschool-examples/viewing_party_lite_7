class MovieDetailsFacade
  attr_reader :movie_id

  def initialize(movie_id)
    @movie_id = movie_id
  end
  
  def details
    response = MovieService.new.movie_details(@movie_id)

  end
end