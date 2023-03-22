class MovieFacade
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def movies
    service = MovieService.new
    json = service.movie_by_id(@movie_id)

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end