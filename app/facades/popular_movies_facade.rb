class PopularMoviesFacade
  def initialize
  end

  def movies
    service = PopularMoviesService.new

    json = service.popular_movies
    movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
    @movies = movies.first(20)
  end
end