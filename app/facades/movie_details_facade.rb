class MovieDetailsFacade

  def self.movie_by_id(id)
    movie_data = MovieService.movies_by_id(id)
    Movie.new(movie_data)
  end

  
end