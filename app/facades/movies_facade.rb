class MoviesFacade

  def self.top_twenty_movies
    MovieService.top_20_flicks[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movies_by_keyword(search)
    MovieService.movie_search(search)[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movie_by_id(id)
    movie_data = MovieService.movies_by_id(id)
    Movie.new(movie_data)
  end

  def self.movies_cast(id)
    movie_data = MovieService.movie_cast(id)
    Movie.new(movie_data)
  end

  def self.movie_reviewed(id)
    movie_data = MovieService.movie_review(id)
    Movie.new(movie_data)
  end
end
