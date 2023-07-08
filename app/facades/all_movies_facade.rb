class AllMoviesFacade
  def initialize(movies)
    @movies = movies
  end

  def details
    service = MovieService.new
    request = service.all_movies
    @movies = request[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end