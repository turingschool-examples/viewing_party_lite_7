class MovieFacade
  def initialize(endpoint)
    @endpoint = endpoint
  end

  def movies
    @movies = results[:results]
  end

  def movie
    @movie = Movie.new(results)
  end

  def cast
    @cast = results[:cast].first(10)
  end

  def reviews
    @reviews = results[:results]
  end

  def image
    @image = results[:images]
  end
  
  private

  def results
    MovieService.new.end_point(@endpoint)
  end

end