class PopularMoviesFacade
  def initialize
  end

  def movies
    service = MovieService.new

    json = service.popular_movies
    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end