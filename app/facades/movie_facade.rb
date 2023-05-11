class MovieFacade 
  def movie_search(key_word)
    results = service.movie_search(key_word)[:results]
    
    results.map do |result|
      Movie.new(result)
    end
  end

  def top_rated_movies
    results = service.top_rated_movies[:results]

    results.map do |result|
      Movie.new(result)
    end
  end

  private
  def service
    TmdbService.new
  end
end