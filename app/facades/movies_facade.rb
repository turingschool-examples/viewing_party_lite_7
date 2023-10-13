class MoviesFacade

  def initialize(movie_id = nil)
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

  def movie_search(search)
    MovieService.new.movie_search(search)
  end

  def movie_discover
    MovieService.new.movie_discover
  end

end