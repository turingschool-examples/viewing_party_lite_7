class MovieFacade
  def self.top_movies
    movies = MovieService.top_movies
    movies[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def self.movies_search(search)
    movies = MovieService.movies_search(search)
    movies[:results].map do |movie|
      Movie.new(movie)
    end
  end
end