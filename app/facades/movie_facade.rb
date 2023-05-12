class MovieFacade
  attr_reader :id, :movie

  def initialize(id)
    @id = id
    @movie = Movie.new(movie_details, movie_credits)
  end

  def title
    @movie.title
  end

  def vote_average
    @movie.vote_average
  end

  def runtime
    @movie.runtime
  end

  def genres
    @movie.genres
  end

  def summary
    @movie.summary
  end

  def cast_members
    @movie.cast_members
  end

  def review_count
    @movie.review_count
  end

  def reviews
    @movie.reviews
  end

  private

  def movie_details
    service.movie_details(@id)
  end

  def movie_credits
    service.movie_credits(@id)
  end

  def service
    @_service ||= MovieDbService.new
  end
end
