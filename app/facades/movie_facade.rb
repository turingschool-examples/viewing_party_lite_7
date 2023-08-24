class MovieFacade
  def top_rated
    results = service.top_rated[:results]
    results.map do |result|
      Movie.new(result)
    end
  end

  def search(keyword)
    results = service.search(keyword)[:results]
    results.map do |result|
      Movie.new(result)
    end
  end

  def reviews(movie_id)
    results = service.reviews(movie_id)[:results]
    results.map do |result|
      Reviews.new(result)
    end
  end

  def cast(movie_id)
    results = service.cast(movie_id)[:cast]
    results.map do |result|
      Cast.new(result)
    end
  end

  def find_movie(movie_id)
    results = service.find_movie(movie_id)
    Movie.new(results)
  end

  def service
    MovieService.new
  end
end