class MovieFacade 
  def get_results(key_word)
    if key_word == 'top%20rated'
      top_rated_movies
    else
      search_by_title(key_word)
    end 
  end

  def search_by_title(key_word)
    results = service.search_by_title(key_word)[:results]
    
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
    @_service ||= TmdbService.new
  end
end