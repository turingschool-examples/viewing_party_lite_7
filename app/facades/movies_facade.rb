class MoviesFacade

  def initialize(movie_id)
    @movie_id = movie_id.to_i
  end

  def movie
    MovieService.new.movie(@movie_id)
  end

  def cast
    MovieService.new.cast(@movie_id)
  end

  def reviews
    MovieService.new.reviews(@movie_id)
  end

  def movie_search
    MovieService.new.movie_search
  end

  def movie_discover
    MovieService.new.movie_discover
  end

end