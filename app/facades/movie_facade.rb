class MovieFacade
  def get_movies(key_word)
    if key_word == 'top rated'
      top_rated
    else
      search(key_word)
    end
  end

  def search(key_word)
    results = service.search(key_word)[:results]

    results.map do |result|
      Movie.new(result)
    end
  end

  def top_rated
    results = service.top_rated[:results]

    results.map do |result|
      Movie.new(result)
    end
  end

  def find_movie(movie_id)
    result = service.find_movie(movie_id)
    MovieDetailed.new(result)
  end

  def cast(movie_id)
    results = service.credits(movie_id)[:cast]

    results[0..9].map do |result|
      Cast.new(result)
    end
  end

  private

  def service
    @service ||= MovieService.new
  end
end
