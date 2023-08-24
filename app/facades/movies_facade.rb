class MoviesFacade
  def initialize(movie)
    @movie = movie
  end

  def self.top_twenty_movies
    MovieService.top_20_flicks.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movies_by_keyword(search)
    MovieService.movie_search(search).map do |movie_data|
      Movie.new(movie_data)
    end
  end
end