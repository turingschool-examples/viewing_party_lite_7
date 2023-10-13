class MoviesFacade

  def initialize(movie_id = nil)
    @movie_id = movie_id.to_i
  end
  
  def movie
    Movie.new(MovieService.new.movie(@movie_id))
  end
  
  def cast
    data = MovieService.new.cast(@movie_id)
    data.map do |cast_data|
      Cast.new(cast_data)
    end
  end

  def reviews
    data = MovieService.new.reviews(@movie_id)
    data[:results].map do |review_data|
      Review.new(review_data, data[:total_results])
    end
  end

  def movie_search(search)
    MovieService.new.movie_search(search)
  end

  def movie_discover
    MovieService.new.movie_discover
  end

end