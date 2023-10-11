class MovieFacade
  def initialize(endpoint)
    @endpoint = endpoint
  end

  def movies
    service = MovieService.new

    results = service.end_point(@endpoint)

    @movies = results[:results]
  end

  def movie
    service = MovieService.new

    results = service.end_point(@endpoint)

    @movie = Movie.new(results)
  end

  def cast
    service = MovieService.new

    results = service.end_point(@endpoint)

    @cast = results[:cast].first(10)
  end

  def reviews
    service = MovieService.new

    results = service.end_point(@endpoint)

    @reviews = results[:results]
  end
end