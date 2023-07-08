class SearchFacade
  def initialize(movie)
    @movie = movie
  end

  def movies

    service = MovieService.new
    json = service.movie(@movie)

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end